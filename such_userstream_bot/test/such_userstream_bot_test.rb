require 'minitest/autorun'
require 'minitest/pride'

require_relative '../src/such_userstream_bot.rb'

class TestSuchUserstreamBot <  MiniTest::Test

  def test_reverses_hello_world
    assert_match (SuchUserstreamBot.respond_to 'hello world'), 'dlrow olleh'
  end

end
