require_relative 'twitter_bot_generator/version.rb'

class TwitterBotGenerator

  class << self

    def generate bot_name
      puts "scaffolding a twitter bot that is named #{bot_name}!"
      Dir.mkdir bot_name
      dirname = "#{bot_name}/"
      puts "mkdir #{dirname}"
      folders.each do |folder|
        Dir.mkdir dirname + folder
        puts "mkdir #{dirname + folder}"
      end
      (files bot_name).each do |(file_name, contents)|
        puts "touch #{dirname}#{file_name}"
        File.open bot_name + '/' + file_name, 'w' do |f|
          f.write contents
        end
      end
      puts 'done generating! your turn now!'
      puts "$ cd #{bot_name}"
      puts '$ bundle install'
      puts '$ ./test.rb'
      puts '$ ./spec.rb'
      puts 'HAVE FUN BE SAFE PLAY NICE'
    end

  private

    def folders
      %w(lib src test)
    end

    def files bot_name
      {
        'bot.rb' => "require_relative 'src/#{bot_name}.rb'\nrequire 'twitter'\ntwitter = Twitter::REST::Client.new do |config|\n  config.consumer_key = ENV['TWITTER_CONSUMER_KEY']\n  config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']\n  config.access_token = ENV['TWITTER_ACCESS_TOKEN']\n  config.access_token_secret = ENV['TWITTER_ACCESS_SECRET']\nend\n\nloop do\n  begin\n    twitter.update #{camelize bot_name}.generate\n  ensure\n    sleep 10800 + (rand 5400)\n  end\nend\n",
        '.gitignore' => ".DS_Store\n*/.DS_Store\nnotes.todo\n",
        'Gemfile' => "source 'https://rubygems.org'\nruby '2.0.0'\ngem 'twitter'\n",
        'README.md' => "\# #{bot_name}\nA Twitter Bot",
        'Procfile' => "bot: ruby bot.rb\n",
        'spec.rb' => "#!/usr/bin/env ruby\nrequire_relative 'src/#{bot_name}'\n12.times { puts #{camelize bot_name}.generate }",
        'test.rb' => "#!/usr/bin/env ruby\n\nDir.glob('./test/*_test.rb').each { |file| require file }",
        "test/#{bot_name}_test.rb" => "require 'minitest/autorun'\nrequire_relative '../src/#{bot_name}.rb'\n\nclass Test#{camelize bot_name} <  MiniTest::Test\n  def test_generate_returns_hello_world\n    assert_match /Hello/, #{camelize bot_name}.generate\n  end\n  def test_hides_greetings\n    refute_respond_to #{camelize bot_name}, :greetings\n  end\n  def test_hides_io_metal\n    refute_respond_to #{camelize bot_name}, :load_txt_file\n  end\nend",
        "src/#{bot_name}.rb" => "class #{camelize bot_name}\n\n  class << self\n\n    def generate\n      greetings.sample\n    end\n\n  protected\n\n    def greetings\n      ['Hello World!', 'Hello Twitter!', 'Hello Ruby!']\n    end\n\n  private\n\n    def load_txt_file file_name\n      (File.readlines (File.join 'lib', file_name)).map &:strip\n    end\n\n  end\n\nend\n",
        'lib/.gitkeep' => 'lol'
      }
    end

    def camelize str
      ((str.split '_').map &:capitalize).join
    end

  end

end