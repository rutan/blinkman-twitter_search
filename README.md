# Blinkman::TwitterSearch

Twitter Search API adapter for [Blinkman](https://github.com/kinoppyd/blinkman)

## Require configuration

|ENV key|value|require|
|-------|-----|-------|
|TWITTER_CONSUMER_KEY|Twitter application key|yes|
|TWITTER_CONSUMER_SECRET|Twitter application secret|yes|
|TWITTER_ACCESS_TOKEN|Your Twitter access token|yes|
|TWITTER_ACCESS_TOKEN_SECRET|Your Twitter access token secret|yes|
|TWITTER_SEARCH_KEYWORD|Search keyword (ex. 'がんばるぞい OR 頑張るぞい')|yes|
|TWITTER_SEARCH_LANG|Search language (ex. ja)|no|
|TWITTER_SEARCH_WAIT_TIME|Search interval time. default 30 sec.|no|

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'blinkman'
gem 'blinkman-twitter_search'
```

And then execute:

    $ bundle install

## Usage

```ruby
require 'blinkman'

bot = Blinkman::Bot.new do
  blink green(2.times, during(250), when_if { |message|
    puts message.body # => 今日も一日がんばるぞい！
    true
  })
end

bot.listen
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rutan/blinkman-twitter_search.

## License
MIT

