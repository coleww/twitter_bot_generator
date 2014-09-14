require_relative 'src/such_userstream_bot.rb'
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

TweetStream::Client.new.userstream do |tweet|
  puts "@#{tweet.user.screen_name} asks: #{tweet.text}"
  begin
    puts (answer = SuchUserstreamBot.respond_to tweet.text)
    Twitter.update(answer, :in_reply_to_status_id => tweet.id)
  rescue => e
    puts e
  end
end