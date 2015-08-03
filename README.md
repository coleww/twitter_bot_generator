# twitter_bot_generator

# DEPRECATED

this gem used to exploit heroku's infinite free dynos to run itself, but those days are over now. You can probably easily modify the generated code to be more cron-friendly, but i'm doing everything in node now so HAVE FUN BYE






-----------------------------------------------------------------



[![Gem Version](https://badge.fury.io/rb/twitter_bot_generator.svg)](http://badge.fury.io/rb/twitter_bot_generator) [![Build Status](https://travis-ci.org/coleww/twitter_bot_generator.svg?branch=master)](https://travis-ci.org/coleww/twitter_bot_generator) 

#### I GENERATE TWITTER BOTS! RUBY IS JOY!


## Installation

    $ gem install twitter_bot_generator

## Usage

get --help

```
$ twitter_bot_generator --help
twitter_bot_generator <yr_bots_name_camel_cased> (--<OPTIONAL OPTION>)
## creates a new directory called <yr_bots_name_camel_cased> in the current working directory,
and fills it with a bunch of boilerplate goodness
for building a bot that says stuff at a semi-random interval
OPTIONAL ALTERNATIVE OPTIONS:
--streaming || -S: generates a bot that listens to the "gardenhose"
--userstream || -U: generates a bot that listens for tweets @ it
have fun be kind to each other thanks goodbye!
```


make a bot

```
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

The source is short and hopefully self-explanatory, but if not there is also the :dancer: [twitter-art-robot-tutorial](http://github.com/coleww/twitter-art-bot-tutorial) :dancers: to guide you. Or open an issue on this repo if you need help!


## Some bots made with this gem

Make a PR against this repo to add yrs!

*  [no more meta art](https://github.com/coleww/meta_art_bot) reminds me to stop making projects that are just silly in-jokes

*  [NPM generator](https://github.com/coleww/npm-bot-dude) invents new uses/meanings for NPM

*  [Hot New Superpowers!](https://github.com/coleww/power_bot) invents new super powers through markov magic

*  [FriendFeld](https://github.com/coleww/friendfeld) mashes up friends and seinfeld episode titles

*  [dada bot](https://github.com/coleww/dadabot) tweets simple things related to dadaism

*  [MiniTest::Warner](https://github.com/coleww/mini_test_warner_bot) tweets more complex phrases, it makes up fake deprecation warnings

*  [adams song bot](https://github.com/coleww/adams_song_bot) retweets tweets that match lyrics from adams song by blink 182


## Contribute

Comments and suggestions are super welcome! Open an issue or comment on an existing one :+1: 


## further hacking and academic research

Check out docs/sauce for [twitter gem by sferik](https://github.com/sferik/twitter) /// [tweetstream](https://github.com/tweetstream/tweetstream) /// [twitter api](https://dev.twitter.com/overview/documentation).

