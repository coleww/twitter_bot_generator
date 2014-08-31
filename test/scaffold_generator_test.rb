require 'minitest/autorun'
require 'minitest/autorun'
require 'minitest/pride'
require 'fakefs'
require_relative "../lib/twitter_bot_generator.rb"

# BEFORE :all DO |o|
  TwitterBotGenerator.generate 'such_test_bot'
# END :EVERYTHING

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

  def test_it_creates_a_gitignore_with_defaults
    assert_equal true, (File.exists? './such_test_bot/.gitignore')
  end

  def test_it_creates_a_gemfile_with_defaults
    assert_equal true, (File.exists? './such_test_bot/Gemfile')
  end

  def test_it_creates_a_readme_with_defaults
    assert_equal true, (File.exists? './such_test_bot/README.md')
  end

  def test_it_creates_a_procfile_with_defaults
    assert_equal true, (File.exists? './such_test_bot/Procfile')
  end

  def test_it_creates_a_spec_runner_with_defaults
    assert_equal true, (File.exists? './such_test_bot/spec.rb')
  end

  def test_it_creates_a_test_runner_with_defaults
    assert_equal true, (File.exists? './such_test_bot/test.rb')
  end

  def test_it_creates_a_smokescreen_test
    assert_equal true, (File.exists? './such_test_bot/test/such_test_bot_test.rb')
  end

  def test_it_creates_boilerplate_class_file
    assert_equal true, (File.exists? './such_test_bot/src/such_test_bot.rb')
  end

  def test_it_creates_bin_slash_gitkeep
    assert_equal true, (File.exists? './such_test_bot/lib/.gitkeep')
  end

end