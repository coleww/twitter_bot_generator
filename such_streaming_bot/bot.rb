require_relative 'src/such_streaming_bot.rb'
require "twitter"
require "tweetstream"

Twitter.configure do |config|
  config.consumer_key       = ENV['TWITTER_CONSUMER_KEY']
  config.consumer_secret    = ENV['TWITTER_CONSUMER_SECRET']
  config.oauth_token        = ENV['TWITTER_OAUTH_TOKEN']
  config.oauth_token_secret = ENV['TWITTER_OAUTH_SECRET']
end

TweetStream.configure do |config|
  config.consumer_key       = ENV['TWITTER_CONSUMER_KEY']
  config.consumer_secret    = ENV['TWITTER_CONSUMER_SECRET']
  config.oauth_token        = ENV['TWITTER_OAUTH_TOKEN']
  config.oauth_token_secret = ENV['TWITTER_OAUTH_SECRET']
  config.auth_method        = :oauth
end

loop do
  begin
    puts "starting search"
    TweetStream::Client.new.sample(language: 'en') do |tweet|
      if SuchStreamingBot.matches? tweet.text
        puts "got one!"
        Twitter.retweet tweet.id
      end
    end
  rescue
    puts 'FAILURE'
  ensure
    sleep 300
  end
end
