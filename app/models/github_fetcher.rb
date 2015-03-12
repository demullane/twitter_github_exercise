class GithubFetcher
  attr_reader :client

  def initialize
    @client = Octokit::Client.new(:access_token => Rails.application.secrets.access_token_github)
  end

  def user_finder(username)
    @client.user(username)
  end

  def repos_finder(username)
    @client.repos(username)
  end

end
