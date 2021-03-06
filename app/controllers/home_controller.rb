class HomeController < ApplicationController

  def index
    @page_title = "Twitter API Exercise"
    @page_header = "TWITTER API EXERCISE"

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
    @page_title = "Github API Exercise"
    @page_header = "GITHUB API EXERCISE"
    @page_home = "/github"

    @github_fetcher = GithubFetcher.new

    unless params[:username].blank?
      begin
        @github_user_finder = @github_fetcher.user_finder(params[:username])
        @github_repos_finder = @github_fetcher.repos_finder(params[:username])
      rescue Octokit::NotFound => e
        flash[:alert] = "User not found."
        redirect_to "/github"
      end
    end
  end

  def data
  end

  def reddit
    @page_title = "Reddit API Exercise"
    @page_header = "REDDIT API EXERCISE"
    @page_home = "/reddit"

    @reddit_fetcher = RedditFetcher.new

    unless params[:topic].blank?
      begin
        @reddit_topic_finder = @reddit_fetcher.search_reddit(params[:topic])
      rescue JSON::ParserError => e
        flash[:alert] = "Topic not found."
        redirect_to "/reddit"
      end
    end
  end

end
