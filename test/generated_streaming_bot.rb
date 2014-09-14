require_relative 'test_helper'

wipe_such_test_bot! 'streaming'
TwitterBotGenerator.generate 'such_streaming_bot', '--streaming'

puts 'Running the test suite for the generated STREAMING bot'
Dir.chdir('such_streaming_bot')
puts load '../such_streaming_bot/test/such_streaming_bot_test.rb'
Dir.chdir('..')
