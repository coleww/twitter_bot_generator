# such_test_bot

A Twitter Bot

## Development

```
bundle install
ruby test.rb
ruby spec.rb
```

## Deployment (heroku)

```
heroku create
heroku config:set TWITTER_CONSUMER_KEY=INSERT-YR-SECRETS-HERE
heroku config:set TWITTER_CONSUMER_SECRET=INSERT-YR-SECRETS-HERE
heroku config:set TWITTER_ACCESS_TOKEN=INSERT-YR-SECRETS-HERE
heroku config:set TWITTER_ACCESS_SECRET=INSERT-YR-SECRETS-HERE
git push heroku master
heroku ps:scale bot=1
```

For more help with deployment, check out the [twitter bot tutorial](https://github.com/coleww/twitter-art-bot-tutorial/blob/master/lessons/heroku_deploy.md)
