require 'minitest/autorun'
require 'minitest/autorun'
require 'minitest/pride'
require 'fakefs'
require_relative "../lib/twitter_bot_generator.rb"

class TestTwitterBotGenerator <  MiniTest::Test

  def test_it_generates_something
    assert_respond_to TwitterBotGenerator, :generate
  end

end