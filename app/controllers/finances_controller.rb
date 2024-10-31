class FinancesController < ApplicationController
  def index 
    if params[:query].present?
      service = SerpApi::GoogleFinanceService.new
      @finances = service.get_stock_data(params[:query])

      if @finances[:error]
        flash[:alert] = "Could not fetch data: #{@finances[:message]}"
        @finances = nil
      end
    end
  end
end
