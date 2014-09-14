require_relative 'src/such_test_bot.rb'
require 'twitter'
twitter = Twitter::REST::Client.new do |config|
  config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
  config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
  config.access_token = ENV['TWITTER_ACCESS_TOKEN']
  config.access_token_secret = ENV['TWITTER_ACCESS_SECRET']
end

loop do
  begin
    twitter.update SuchTestBot.generate
  ensure
    sleep 10800 + (rand 5400)
  end
end
