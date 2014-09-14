require_relative 'test_helper'

wipe_such_test_bot!
TwitterBotGenerator.generate 'such_test_bot'

puts 'Running the test suite for the generated DEFAULT bot'
Dir.chdir('such_test_bot')
puts load '../such_test_bot/test/such_test_bot_test.rb'
Dir.chdir('..')