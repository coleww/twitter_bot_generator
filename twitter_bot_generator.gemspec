# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'twitter_bot_generator/version'

Gem::Specification.new do |spec|
  spec.name          = "twitter_bot_generator"
  spec.version       = TwitterBotGenerator::VERSION
  spec.authors       = ["Cole Willsea"]
  spec.email         = ["coleww@gmail.com"]
  spec.summary       = %q{WIP DONUT USE! Generates a twitter bot template from command line.}
  spec.description   = %q{WIP DONUT USE! gem install twitter_bot_generator && twitter_bot_generator new_twitter_bot}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = ['twitter_bot_generator']
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'test_construct'
  spec.add_development_dependency 'minitest'
end
