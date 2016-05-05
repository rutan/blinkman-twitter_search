require 'mihatter'

module Blinkman
  module Adapter
    class TwitterSearch < Base
      include Configurable

      configure 'twitter_consumer_key'
      configure 'twitter_consumer_secret'
      configure 'twitter_access_token'
      configure 'twitter_access_token_secret'

      configure 'twitter_search_keyword'
      configure 'twitter_search_lang', optional: true
      configure 'twitter_search_wait_time', optional: true

      def listen
        mihatter.run! do |tweet|
          next unless tweet.retweeted_status.kind_of?(Twitter::NullObject)
          message = Blinkman::Message::TwitterSearch.new(tweet)
          bot.on_receive(message)
        end
      end

      private

      def mihatter
        @mihatter ||= Mihatter::RestWatcher.new({
          consumer_key: twitter_consumer_key,
          consumer_secret: twitter_consumer_secret,
          access_token: twitter_access_token,
          access_token_secret: twitter_access_token_secret,
          keyword: twitter_search_keyword,
          lang: twitter_search_lang,
          wait_time: (twitter_search_wait_time || 30).to_i,
        })
      end
    end
  end
end

