require_relative 'test_helper'

wipe_such_test_bot! 'userstream'
TwitterBotGenerator.generate 'such_userstream_bot', '--userstream'

puts 'Running the test suite for the generated USERSTREAM bot'
Dir.chdir('such_userstream_bot')
puts load '../such_userstream_bot/test/such_userstream_bot_test.rb'
Dir.chdir('..')
