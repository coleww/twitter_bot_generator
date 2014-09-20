require 'minitest/autorun'
require 'minitest/pride'

require_relative '../src/such_streaming_bot.rb'

class TestSuchStreamingBot <  Minitest::Test

  def test_matches_hello_world
    assert_equal true, (SuchStreamingBot.matches? 'hello world')
  end

  def test_doesnt_match_hello_canada
    assert_equal false, (SuchStreamingBot.matches? 'hello canada')
  end

end
