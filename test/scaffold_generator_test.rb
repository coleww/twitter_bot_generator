require 'minitest/autorun'
require 'minitest/autorun'
require 'minitest/pride'
require 'coveralls'
Coveralls.wear!

require_relative "../lib/twitter_bot_generator.rb"

# before :all do
TwitterBotGenerator.generate 'such_test_bot'

# Running the test suite for the generated bot
require_relative '../such_test_bot/test/such_test_bot_test.rb'

class TestTwitterBotGenerator <  MiniTest::Test

  def test_it_creates_an_app_directory
    assert_equal true, (Dir.exists? './such_test_bot')
  end

  def test_it_creates_a_lib_directory
    assert_equal true, (Dir.exists? './such_test_bot/lib')
  end

  def test_it_creates_a_src_directory
    assert_equal true, (Dir.exists? './such_test_bot/src')
  end

  def test_it_creates_a_test_directory
    assert_equal true, (Dir.exists? './such_test_bot/test')
  end

  def test_it_creates_a_botfile
    assert_equal true, (File.exists? './such_test_bot/bot.rb')
    assert_match /require_relative 'src\/such_test_bot.rb'/, (File.read './such_test_bot/bot.rb')
    assert_match /SuchTestBot.generate/, (File.read './such_test_bot/bot.rb')
  end

  def test_it_creates_a_gitignore
    assert_equal true, (File.exists? './such_test_bot/.gitignore')
    assert_match /.DS_Store/, (File.read './such_test_bot/.gitignore')
    assert_match /notes.todo/, (File.read './such_test_bot/.gitignore')
  end

  def test_it_creates_a_gemfile
    assert_equal true, (File.exists? './such_test_bot/Gemfile')
    assert_match /gem 'twitter'/, (File.read './such_test_bot/Gemfile')
  end

  def test_it_creates_a_readme
    assert_equal true, (File.exists? './such_test_bot/README.md')
    assert_match /\# such_test_bot\nA Twitter Bot/, (File.read './such_test_bot/README.md')
  end

  def test_it_creates_a_procfile
    assert_equal true, (File.exists? './such_test_bot/Procfile')
    assert_match /bot: ruby bot.rb\n/, (File.read './such_test_bot/Procfile')
  end

  def test_it_creates_a_spec_runner
    assert_equal true, (File.exists? './such_test_bot/spec.rb')
    assert_match /12.times { puts SuchTestBot.generate }/, (File.read './such_test_bot/spec.rb')
  end

  def test_it_creates_a_test_runner
    assert_equal true, (File.exists? './such_test_bot/test.rb')
    assert_match /Dir.glob('.\/test\/*_test.rb').each { |file| require file }/, (File.read './such_test_bot/test.rb')

  end

  def test_it_creates_a_smokescreen_test
    assert_equal true, (File.exists? './such_test_bot/test/such_test_bot_test.rb')
    assert_match /class TestSuchTestBot/, (File.read './such_test_bot/test/such_test_bot_test.rb')
  end

  def test_it_creates_boilerplate_class_file
    assert_equal true, (File.exists? './such_test_bot/src/such_test_bot.rb')
    assert_match /class SuchTestBot/, (File.read './such_test_bot/src/such_test_bot.rb')
    assert_match /def generate/, (File.read './such_test_bot/src/such_test_bot.rb')
  end

  def test_it_creates_bin_slash_gitkeep
    assert_equal true, (File.exists? './such_test_bot/lib/.gitkeep')
    assert_match /lol/, (File.read './such_test_bot/lib/.gitkeep')
  end

  def test_camelize
    klass = TwitterBotGenerator.send :camelize, 'testing_the_thing'
    assert_equal 'TestingTheThing', klass
  end

end

MiniTest::Unit.after_tests do
  ['./such_test_bot/Gemfile',
    './such_test_bot/README.md',
    './such_test_bot/test.rb',
    './such_test_bot/Procfile',
    './such_test_bot/bot.rb',
    './such_test_bot/spec.rb',
    './such_test_bot/test/such_test_bot_test.rb',
    './such_test_bot/lib/.gitkeep',
    './such_test_bot/src/such_test_bot.rb',
    './such_test_bot/.gitignore'].each { |file| File.unlink file }

  ['./such_test_bot/lib',
    './such_test_bot/src',
    './such_test_bot/test',
    './such_test_bot'].each { |dir| Dir.rmdir dir }
end