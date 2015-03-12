class DataFetcher

  def initialize
    @colo_data_connection = Faraday.new(:url => 'https://data.colorado.gov') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end

  def biz_entity
    response = @colo_data_connection.get do |req|
      req.url "/resource/colorado-business-entities.json", { entityid: 20151154239 }
      req.headers['X-App-Token'] = Rails.application.secrets.x_app_token
      req.headers['Content-Type'] = 'application/json'
    end
    JSON.parse(response.body)
  end

end

#results.map { |entity| entity["entityname"] |}
