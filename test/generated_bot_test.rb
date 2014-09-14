require_relative 'test_helper'

wipe_such_test_bot!
TwitterBotGenerator.generate 'such_test_bot'

# # Running the test suite for the generated bot
Dir.chdir('such_test_bot')
puts Dir.entries("lib").join

require_relative '../such_test_bot/test/such_test_bot_test.rb'
Dir.chdir('..')