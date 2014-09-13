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

This will create a skeleton class named YrBotNameSnakeCaseStyleYes, some smokescreen minitest::unit tests, and a variety of other "ruby app on free heroku instance" boiler plate.

## Deployment (heroku)

Once your bot has been well tested on the command line you'll need to get it out into the world!

0. You probably need git and the heroku toolbet installed and also a heroku account.
0. Make a twitter account for your bot. Give it a photo and header and some biographical information
0. Go into settings > mobile and add a cell phone number that you can send a text from.
    not all carriers will work :(
    without a mobile number, twitter won't let you get the api keys you need to deploy
    if your mobile number is associated with your personal account, temporarily delete it from that account so you can use it for your bot. Twitter doesn't care.
0. go to apps.twitter.com and sign in again
0. click create a new app
0. fill in the details. just put down the github repo link or twitter page for the bot as website/callback url. no one will ever see this except you.
0. once your app is created, click "modify app permissions" and set the app to read and write
0. wait a lil bit for permissions to change.......
0. click 'generate my access token'
0. wait a lil bit to get access tokens.....
0. SUCCESS! copy the access tokens down to a scratch txt file, but make sure not to commit it to source control/git/etc.! That would be bad because these things are secrets.
0. From the command line:

```
heroku create
heroku config:set TWITTER_CONSUMER_KEY=INSERT-YR-SECRETS-HERE
heroku config:set TWITTER_CONSUMER_SECRET=INSERT-YR-SECRETS-HERE
heroku config:set TWITTER_ACCESS_TOKEN=INSERT-YR-SECRETS-HERE
heroku config:set TWITTER_ACCESS_SECRET=INSERT-YR-SECRETS-HERE
 ```

0. go back to twitter.com and delete yr mobile phone from the bot account. you may also want to disable email notifications as well.
0. THE MAIN EVENT:

```
git push heroku master
heroku ps:scale bot=1
```

0. go to your bot's page and you should see it's first tweet! Or something?

This gem was made for use in the twitter-art-robot-[tutorial](http://github.com/coleww/twitter-art-tutorial) and more details and documentation and such will be there when things happen. :dancers:

## Contribute

    all kinds of issues in the thing to the upper right! =>
    comment on something if it sounds cool to u
