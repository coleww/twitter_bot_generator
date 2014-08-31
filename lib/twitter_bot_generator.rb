require_relative 'twitter_bot_generator/version.rb'



class TwitterBotGenerator

  class << self

    def generate bot_name
      @@bot_name = bot_name
      Dir.mkdir bot_name
      folders.each do |folder|
        Dir.mkdir bot_name + '/' + folder
      end
      files.keys.each do |file|
        File.open bot_name + '/' + file, 'w' do |f|
          f.write files[file]
        end
      end
    end

  private
    def folders
      %w(lib src test)
    end

    def files
      {
        '.gitignore' => '',
        'Gemfile' => '',
        'README.md' => '',
        'Procfile' => '',
        'spec.rb' => '',
        'test.rb' => '',
        'test/' + @@bot_name + '_test.rb' => '',
        'src/'  + @@bot_name + '.rb' => '',
        'lib/.gitkeep' => ''
      }
    end

  end

end