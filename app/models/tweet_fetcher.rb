class TweetFetcher

  def initialize
    @client =  Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.secrets.consumer_key
      config.consumer_secret     = Rails.application.secrets.consumer_secret
      config.access_token        = Rails.application.secrets.access_token
      config.access_token_secret = Rails.application.secrets.access_token_secret
    end
  end

  def search_twitter(username)
    @client.user_timeline(username)
  end

  def post_tweet(message)
    @client.update(message)
  end

  def danielle_follows
    @client.home_timeline
  end

  def follow_user(follow_username)
    @client.follow(follow_username)
  end

end
