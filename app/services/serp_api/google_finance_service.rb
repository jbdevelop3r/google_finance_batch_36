# app/services/serp_api/google_finance_service.rb
module SerpApi
  class GoogleFinanceService
    include HTTParty
    base_uri 'https://serpapi.com'

    def initialize(api_key = ENV['SERPAPI_API_KEY'])
      @api_key = api_key
    end

    def get_stock_data(query)
      response = self.class.get("/search.json", query: {
        api_key: @api_key,
        engine: "google_finance",
        q: query
      })
      handle_response(response)
    end

    private

    def handle_response(response)
      if response.success?
        response.parsed_response
      else
        { error: "API request failed", status: response.code, message: response.message }
      end
    end
  end
end
