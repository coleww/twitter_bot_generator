# twitter_bot_generator

[watch this terrible hour long clicky screencast to see it in action!](https://vimeo.com/105286654)

#### I GENERATE TWITTER BOTS! RUBY IS JOY!

## Installation

    $ gem install twitter_bot_generator

## Usage

    $ twitter_bot_generator yr_bot_name_snake_case_style_yes
    
This will create a skeleton class named YrBotNameSnakeCaseStyleYes, some smokescreen minitest::unit tests, and a variety of other "ruby app on free heroku instance" boiler plate.

You will need to manually set the config variables with yr twitter api keys on heroku for deployment. For development I recommend writing some minitests or just doing it manually on the command line if the bot is simple enough. Testing the bot "live" can run into potential "twitter banning yr bot before 

This gem was made for use in the twitter-art-robot-[tutorial](http://github.com/coleww/twitter-art-tutorial) and more details and documentation and such will be there when things happen. :dancers:

## TODO

    ADD test for load lines, push greetings to a txt file, etc.

    add help dialog

    docs on getting/setting twitter keys? heroku deployment? (link to tut?)

    handle CLI errors better

    --markov flag. chuck .txt in lib and then set it loose

    --db flag to get a mini AR::Base thing. migrations? HOW TO DO THAT.

    --no-tests cuz sometimes, like, y? uno?

    --streaming. set up a simple regex listener thing on timeline or gardenhose
