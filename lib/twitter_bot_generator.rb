require_relative 'twitter_bot_generator/version.rb'
require 'erb'
require 'ostruct'

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

  protected

    def folders
      %w(lib src test)
    end

    def files bot_name
      varz = grab_a_binding_for bot_name
      {
        'bot.rb' => (render_code 'bot.rb', varz),
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

    def grab_a_binding_for bot_name
      OpenStruct.new bot_name: bot_name, class_name: (camelize bot_name)
    end

    def render_code file_name, varz
      get_template(file_name).result(varz.instance_eval { binding })
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