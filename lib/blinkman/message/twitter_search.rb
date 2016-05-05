module Blinkman
  module Message
    class TwitterSearch < Base
      def body
        original_message.text
      end
    end
  end
end

