class RedditFetcher

  def initialize
    @reddit_connection = Faraday.new(:url => 'http://www.reddit.com') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end

  def r_programming
    response = @reddit_connection.get do |req|
      req.url "/r/programming.json"
      req.headers['Content-Type'] = 'application/json'
    end
    JSON.parse(response.body)
  end

end

# results["data"]["children"].map { |post| post["author"]}
# results["data"]["children"].map { |child| ["data"]["title"]}
