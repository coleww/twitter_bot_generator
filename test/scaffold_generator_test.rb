require 'minitest/autorun'
require 'minitest/autorun'
require 'minitest/pride'
require 'fakefs'
require_relative "../lib/twitter_bot_generator.rb"

class TestTwitterBotGenerator <  MiniTest::Test

  def setup
    TwitterBotGenerator.generate 'such_test_bot'
  end

  def test_it_creates_an_app_directory
    assert_equal true, (Dir.exists? './such_test_bot')
  end

end