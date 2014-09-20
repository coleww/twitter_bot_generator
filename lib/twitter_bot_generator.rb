require_relative 'twitter_bot_generator/version.rb'
require 'erb'
require 'ostruct'

class TwitterBotGenerator

  class << self

    def generate bot_name, flag=''
      welcome_message bot_name, flag
      make_directories! bot_name
      write_files! bot_name, flag
      exit_message bot_name
    end

  protected

    def welcome_message bot_name, flag
      descriptor = ''
      if flag == '--streaming' || flag == '-S'
        descriptor = 'streaming '
      elsif flag == '--userstream' || flag == '-U'
        descriptor = 'userstream '
      end
      puts "scaffolding a #{descriptor}twitter bot named #{bot_name}!"
    end

    def make_directories! bot_name
      Dir.mkdir bot_name
      puts "mkdir #{bot_name}/"
      folders.each do |folder|
        folder_path = File.join bot_name, folder
        Dir.mkdir folder_path
        puts "mkdir #{folder_path}/"
      end
    end

    def write_files! bot_name, flag
      (files bot_name, flag).each do |(file_name, contents)|
        file_path = File.join bot_name, file_name
        puts "touch #{file_path}"
        File.open file_path, 'w' do |f|
          f.write contents
        end
      end
    end

    def exit_message bot_name
      puts 'done generating! your turn now!'
      puts "$ cd #{bot_name}"
      puts '$ bundle install'
      puts '$ ruby test.rb'
      puts '$ ruby spec.rb'
      puts 'HAVE FUN BE SAFE PLAY NICE'
    end

  private

    def folders
      %w(lib src test)
    end

    def files bot_name, flag
      varz = grab_a_binding_for bot_name
      {
        'bot.rb' => (render_code 'bot.rb', varz),
        '.gitignore' => (render_code '.gitignore', varz),
        '.travis.yml' => (render_code '.travis.yml', varz),
        'Gemfile' => (render_code 'Gemfile', varz),
        'README.md' => (render_code 'README.md', varz),
        'Procfile' => (render_code 'Procfile', varz),
        'spec.rb' => (render_code 'spec.rb', varz),
        'test.rb' => (render_code 'test.rb', varz),
        "test/#{bot_name}_test.rb" => (render_code 'test/test_bot_test.rb', varz),
        "src/#{bot_name}.rb" => (render_code 'src/test_bot.rb', varz),
        'lib/greetings.txt' => (render_code 'lib/greetings.txt', varz)
      }.tap do |filz|
        if flag == '--streaming' || flag == '-S'
          filz['bot.rb'] = (render_code 'streaming-bot.rb', varz)
          filz['spec.rb'] = (render_code 'streaming-spec.rb', varz)
          filz["test/#{bot_name}_test.rb"] = (render_code 'test/streaming-test_bot_test.rb', varz)
          filz["src/#{bot_name}.rb"] = (render_code 'src/streaming-test_bot.rb', varz)
        elsif flag == '--userstream' || flag == '-U'
          filz['bot.rb'] = (render_code 'userstream-bot.rb', varz)
          filz['spec.rb'] = (render_code 'userstream-spec.rb', varz)
          filz["test/#{bot_name}_test.rb"] = (render_code 'test/userstream-test_bot_test.rb', varz)
          filz["src/#{bot_name}.rb"] = (render_code 'src/userstream-test_bot.rb', varz)
        end
      end
    end

    def grab_a_binding_for bot_name
      openstructicon = OpenStruct.new bot_name: bot_name, class_name: (camelize bot_name)
      openstructicon.instance_eval { binding }
    end

    def render_code file_name, varz
      (get_template file_name).result varz
    end

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