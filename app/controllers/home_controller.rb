class HomeController < ApplicationController

  def index
    @tweet_fetcher = TweetFetcher.new
    @tweet_finder = @tweet_fetcher.search_twitter(params[:username])
  end

end
