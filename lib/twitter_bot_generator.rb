require_relative 'twitter_bot_generator/version.rb'

class TwitterBotGenerator

  class << self

    def generate bot_name
      Dir.mkdir bot_name
      folders.each do |folder|
        Dir.mkdir bot_name + '/' + folder
      end
      (files bot_name).each do |(file_name, contents)|
        File.open bot_name + '/' + file_name, 'w' do |f|
          f.write contents
        end
      end
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
        'README.md' => "\# #{bot_name}\nA Twitter Bot\n\n[Template created with Twitter_Bot_Generator](https://github.com/coleww/twitter_bot_generator)",
        'Procfile' => "bot: ruby bot.rb\n",
        'spec.rb' => "#!/usr/bin/env ruby\nrequire_relative 'src/#{bot_name}'\n12.times { puts #{camelize bot_name}.generate }",
        'test.rb' => '',
        "test/#{bot_name}_test.rb" => '',
        "src/#{bot_name}.rb" => '',
        'lib/.gitkeep' => 'lol'
      }
    end

    def camelize str
      ((str.split '_').map &:capitalize).join
    end

  end

end