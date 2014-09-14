require_relative 'twitter_bot_generator/version.rb'
require 'erb'
require 'ostruct'

class TwitterBotGenerator

  class << self

    def generate bot_name, flag=''
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
      puts '$ ruby test.rb'
      puts '$ ruby spec.rb'
      puts 'HAVE FUN BE SAFE PLAY NICE'
    end

  protected

    def folders
      %w(lib src test)
    end

    def files bot_name
      varz = grab_a_binding_for bot_name
      {
        'bot.rb' => (render_code 'bot.rb', varz),
        '.gitignore' => (render_code '.gitignore', varz),
        'Gemfile' => (render_code 'Gemfile', varz),
        'README.md' => (render_code 'README.md', varz),
        'Procfile' => (render_code 'Procfile', varz),
        'spec.rb' => (render_code 'spec.rb', varz),
        'test.rb' => (render_code 'test.rb', varz),
        "test/#{bot_name}_test.rb" => (render_code 'test/test_bot_test.rb', varz),
        "src/#{bot_name}.rb" => (render_code 'src/test_bot.rb', varz),
        'lib/greetings.txt' => (render_code 'lib/greetings.txt', varz)
      }
    end

    def grab_a_binding_for bot_name
      openstructicon = OpenStruct.new bot_name: bot_name, class_name: (camelize bot_name)
      openstructicon.instance_eval { binding }
    end

    def render_code file_name, varz
      (get_template file_name).result varz
    end

  private

    def camelize str
      ((str.split '_').map &:capitalize).join
    end

    def get_template file_name
      template = read_file file_name
      ERB.new template, nil, "%"
    end

    def read_file file_name
      home_sweet_home = File.expand_path File.dirname __FILE__
      ultimate_pathway = File.join home_sweet_home, '/twitter_bot_generator/templates/', "#{file_name}.erb"
      File.read ultimate_pathway
    end

  end

end