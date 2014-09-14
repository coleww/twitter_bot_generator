# twitter_bot_generator

[![Gem Version](https://badge.fury.io/rb/twitter_bot_generator.svg)](http://badge.fury.io/rb/twitter_bot_generator)

[![Build Status](https://travis-ci.org/coleww/twitter_bot_generator.svg?branch=master)](https://travis-ci.org/coleww/twitter_bot_generator)

[![Coverage Status](https://coveralls.io/repos/coleww/twitter_bot_generator/badge.png?branch=master)](https://coveralls.io/r/coleww/twitter_bot_generator?branch=master)

#### I GENERATE TWITTER BOTS! RUBY IS JOY!


## Installation

    $ gem install twitter_bot_generator

## Usage

```
$ twitter_bot_generator --help
twitter_bot_generator <yr_bots_name_camel_cased>
## creates a new directory called <yr_bots_name_camel_cased> in the current working directory,
and fills it with a bunch of boilerplate goodness

$ twitter_bot_generator wat_fun
scaffolding a twitter bot that is named wat_fun!
mkdir wat_fun/
mkdir wat_fun/lib
mkdir wat_fun/src
mkdir wat_fun/test
touch wat_fun/bot.rb
touch wat_fun/.gitignore
touch wat_fun/Gemfile
touch wat_fun/README.md
touch wat_fun/Procfile
touch wat_fun/spec.rb
touch wat_fun/test.rb
touch wat_fun/test/wat_fun_test.rb
touch wat_fun/src/wat_fun.rb
touch wat_fun/lib/greetings.txt
done generating! your turn now!
$ cd wat_fun
$ bundle install
$ ruby test.rb
$ ruby spec.rb
HAVE FUN BE SAFE PLAY NICE
```

## More Resources

This gem was made for use in the twitter-art-robot-[tutorial](http://github.com/coleww/twitter-art-bot-tutorial) :dancers:

It uses [twitter gem by sferik](https://github.com/sferik/twitter) and sometimes [tweetstream](https://github.com/tweetstream/tweetstream) to connect to various parts of twitter, so you can check out their documentations/sources to find other secret tweeting tricks. The twitter api docs are also [...sometimes useful...](https://dev.twitter.com/overview/documentation).

## Contribute

all kinds of issues in the thing to the upper right! =>
comment on something if it sounds cool to u
