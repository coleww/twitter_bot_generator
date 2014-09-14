require_relative 'test_helper'

wipe_such_test_bot!
TwitterBotGenerator.generate 'such_test_bot', '--streaming'

puts 'Running the test suite for the generated STREAMING bot'
Dir.chdir('such_test_bot')
require_relative '../such_test_bot/test/such_test_bot_test.rb'
Dir.chdir('..')
