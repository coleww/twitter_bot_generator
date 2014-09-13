require 'minitest/autorun'
require 'minitest/autorun'
require 'minitest/pride'
require 'coveralls'
Coveralls.wear!

require_relative "../lib/twitter_bot_generator.rb"

# before :all do
TwitterBotGenerator.generate 'such_test_bot'

Minitest.after_run do
  ['./such_test_bot/Gemfile',
    './such_test_bot/README.md',
    './such_test_bot/test.rb',
    './such_test_bot/Procfile',
    './such_test_bot/bot.rb',
    './such_test_bot/spec.rb',
    './such_test_bot/test/such_test_bot_test.rb',
    './such_test_bot/lib/greetings.txt',
    './such_test_bot/src/such_test_bot.rb',
    './such_test_bot/.gitignore'].each { |file| File.unlink file }

  ['./such_test_bot/lib',
    './such_test_bot/src',
    './such_test_bot/test',
    './such_test_bot'].each { |dir| Dir.rmdir dir }
end