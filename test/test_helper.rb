require 'minitest/autorun'
require 'minitest/pride'
require 'coveralls'
Coveralls.wear!

require_relative "../lib/twitter_bot_generator.rb"

def wipe_such_test_bot! type='test'
  ["./such_#{type}_bot/Gemfile",
    "./such_#{type}_bot/README.md",
    "./such_#{type}_bot/test.rb",
    "./such_#{type}_bot/Procfile",
    "./such_#{type}_bot/bot.rb",
    "./such_#{type}_bot/spec.rb",
    "./such_#{type}_bot/test/such_#{type}_bot_test.rb",
    "./such_#{type}_bot/lib/greetings.txt",
    "./such_#{type}_bot/src/such_#{type}_bot.rb",
    "./such_#{type}_bot/.gitignore",
    "./such_#{type}_bot/.travis.yml"].each { |file| File.unlink file if File.exists? file }

  ["./such_#{type}_bot/lib",
    "./such_#{type}_bot/src",
    "./such_#{type}_bot/test",
    "./such_#{type}_bot"].each { |dir| Dir.rmdir dir if Dir.exists? dir}
  true
end
