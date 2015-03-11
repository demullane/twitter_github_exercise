class GithubFetcher
  attr_reader :client

  def initialize
    @client = Octokit::Client.new(:access_token => Rails.application.secrets.access_token_github)
  end

  def search_github(username)
    @client.user(username)
  end

end
