require_relative 'test_helper'

wipe_such_test_bot!
TwitterBotGenerator.generate 'such_test_bot', '--userstream'

puts 'Running the test suite for the generated USERSTREAM bot'
Dir.chdir('such_test_bot')
puts load '../such_test_bot/test/such_test_bot_test.rb'
Dir.chdir('..')
