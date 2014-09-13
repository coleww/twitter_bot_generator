# twitter_bot_generator

#### I GENERATE TWITTER BOTS! RUBY IS JOY!

## Installation

    $ gem install twitter_bot_generator

## Usage

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
    $ ./test.rb
    $ ./spec.rb
    HAVE FUN BE SAFE PLAY NICE

This will create a skeleton class named YrBotNameSnakeCaseStyleYes, some smokescreen minitest::unit tests, and a variety of other "ruby app on free heroku instance" boiler plate. You will need to manually set the config variables with yr twitter api keys on heroku for deployment or add figaro or some such... documentation/scripts forthcoming

This gem was made for use in the twitter-art-robot-[tutorial](http://github.com/coleww/twitter-art-tutorial) and more details and documentation and such will be there when things happen. :dancers:

## Contribute

    all kinds of issues in the thing to the upper right! =>
    comment on something if it sounds cool to u
