class HomeController < ApplicationController

  def index

    @tweet_fetcher = TweetFetcher.new
    @home_feed = @tweet_fetcher.danielle_follows

    unless params[:username].blank?
      @tweet_finder = @tweet_fetcher.search_twitter(params[:username])
    end

    unless params[:message].blank?
      @tweet_fetcher.post_tweet(params[:message])
    end

    unless params[:follow_username].blank?
      begin
        @tweet_fetcher.follow_user(params[:follow_username])
        flash.now[:notice] = "You are now following #{params[:follow_username]}."
      rescue Twitter::Error => e
        flash.now[:alert] = "#{e.message}"
        render :index
      end
    end

  end

  def github
    @github_fetcher = GithubFetcher.new

    unless params[:username].blank?
      @github_finder = @github_fetcher.search_github(params[:username])
    end
  end


end
