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
        'bot.rb' => "",
        '.gitignore' => ".DS_Store\n*/.DS_Store\nnotes.todo\n",
        'Gemfile' => "source 'https://rubygems.org'\nruby '2.0.0'\ngem 'twitter'\n",
        'README.md' => "\# #{bot_name}\nA Twitter Bot\n\n[Generated with TBG](https://github.com/coleww/twitter_bot_generator)",
        'Procfile' => "bot: ruby bot.rb\n",
        'spec.rb' => '',
        'test.rb' => '',
        "test/#{bot_name}_test.rb" => '',
        "src/#{bot_name}.rb" => '',
        'lib/.gitkeep' => 'lol'
      }
    end

  end

end