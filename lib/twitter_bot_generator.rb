require_relative 'twitter_bot_generator/version.rb'



class TwitterBotGenerator

  class << self

    def generate bot_name
      Dir.mkdir bot_name
      folders.each do |folder|
        Dir.mkdir bot_name + '/' + folder
      end
    end

  private
    def folders
      %w(lib src test)
    end

  end

end