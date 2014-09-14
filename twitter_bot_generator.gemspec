# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'twitter_bot_generator/version'

Gem::Specification.new do |spec|
  spec.name          = "twitter_bot_generator"
  spec.version       = TwitterBotGenerator::VERSION
  spec.authors       = ["Cole Willsea"]
  spec.email         = ["coleww@gmail.com"]
  spec.summary       = %q{Generates a twitter bot template from command line.}
  spec.description   = <<-EOF
    Scaffolds a new boilerplate twitter bot project from the command line.
    By default will create a bot that tweets a "hello world" type greeting once every 3-4.5 hours
    Can also pass a --streaming flag to create a bot that listens to the "gardenhose"
    Or a --userstream flag for a bot that listens for tweets @ it.
    To use:

      $ gem install twitter_bot_generator
      $ twitter_bot_generator --help
      $ twitter_bot_generator my_new_bot
      $ cd my_new_bot
      $ bundle install
      $ ruby test.rb
      $ ruby spec.rb

    etc.
  EOF
  spec.homepage      = "https://github.com/coleww/twitter_bot_generator"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = ['twitter_bot_generator']
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.required_ruby_version = '>= 2.0.0'

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'test_construct'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'coveralls'
end
