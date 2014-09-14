require 'minitest/autorun'
require 'minitest/pride'

require_relative '../src/such_test_bot.rb'

class TestSuchTestBot <  MiniTest::Test

  def test_generate_returns_hello_world
    assert_match /Hello/, SuchTestBot.generate
  end

  def test_generate_returns_less_than_140
    refute [*0...1000].map { |_| SuchTestBot.generate }.any?{ |t| t.length > 140 }
  end

  def test_hides_greetings
    refute_respond_to SuchTestBot, :greetings
    assert_instance_of String, SuchTestBot.send(:greetings)[0]
  end

  def test_hides_io_metal
    refute_respond_to SuchTestBot, :load_txt_file
    assert_equal 3, SuchTestBot.send(:load_txt_file, 'greetings.txt').length
  end

end
