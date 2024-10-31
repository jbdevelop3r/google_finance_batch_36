class FinancesController < ApplicationController
  def index
    if params[:query].present?
      service = SerpApi::GoogleFinanceService.new
      data = service.get_stock_data(params[:query])
      @finances = data["markets"]["asia"] if data["markets"] && data["markets"]["asia"]
      @stock_symbol = data["search_parameters"]["q"]
    end
  end
end
