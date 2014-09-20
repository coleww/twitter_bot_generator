require 'minitest/autorun'
require 'minitest/pride'

require_relative '../src/such_userstream_bot.rb'

class TestSuchUserstreamBot <  Minitest::Test

  def test_reverses_hello_world
    assert_match (SuchUserstreamBot.respond_to 'hello world'), 'dlrow olleh'
  end

  def test_responds_with_less_than_140
    assert_equal false, [*0...1000].map{ |_| SuchUserstreamBot.respond_to 'hello world' + rand.to_s }.any?{ |t| t.length > 140 }
  end

  def test_responds_with_less_than_140_even_to_greater_than_140
    assert_equal false, [*0...1000].map { |_| SuchUserstreamBot.respond_to  'hello' * 30 }.any?{ |t| t.length > 140 }
  end


end
