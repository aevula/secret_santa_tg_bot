# frozen_string_literal: true

require 'telegram/bot'

require './app/handler'

class Bot
  def call(token:)
    Telegram::Bot::Client.run(token) do |bot|
      SemanticLogger['Bot'].info('Started')
      handler = Handler.new(bot)

      bot.listen do |message|
        Thread.current['uuid'] = SecureRandom.uuid
        SemanticLogger['Bot'].tagged(Thread.current['uuid']) { _1.info('Received message') }

        handler.call(message:) if message.is_a?(Telegram::Bot::Types::Message)
      end
    end
  end
end
