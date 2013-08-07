require 'json'
require 'launchy'
require 'oauth'
require 'singleton'
require 'yaml'

class TwitterSession
  include Singleton

  TOKEN_FILE      = "./user_token.yml"

  CONSUMER_KEY    = "AQ6Yin4sPdvOTspCnLdGjg"
  CONSUMER_SECRET = "JHhPW6tN0akv6ZIyE7LpHs9SU2CsoyxuTS9csuN8C8"
  CONSUMER        = OAuth::Consumer.new(CONSUMER_KEY,
                                        CONSUMER_SECRET,
                                        :site  => "https://twitter.com")
  def initialize
    self.get_token
  end

  def get_token
    if File.exist?(TOKEN_FILE)
      File.open(TOKEN_FILE ) { |f| YAML.load(f) }
    else
      # If the file isnt there then get it and yaml it
      access_token = self.request_access_token
      File.open(TOKEN_FILE, "w") { |f| YAML.dump(access_token, f) }

      access_token
    end

    access_token
  end

  def request_access_token
    request_token = CONSUMER.get_request_token
    authorize_url = request_token.authorize_url
    puts "I'm gonna kick you out to Twitter"
    Launchy.open(authorize_url)

    puts "Type your verification code"
    oauth_verifier = gets.chomp

    request_token.get_access_token(
      :oauth_verifier => oauth_verifier
      )
  end

end























