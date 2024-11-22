# frozen_string_literal: true

require './app/menu'

module Handlers
  class Base
    attr_reader :bot, :message, :user

    def self.call(bot:, message:, user:)
      SemanticLogger['Bot'].tagged(Thread.current['uuid']) { _1.info("Handling with #{name}") }
      handler = new(bot:, message:, user:)
      handler.call
    rescue StandardError, ActiveRecord::ActiveRecordError => e
      SemanticLogger['Bot'].error(e)
      handler.reply(text: 'Ошибочка, отправь идиоту код')
    end

    def initialize(bot:, message:, user:)
      @bot = bot
      @message = message
      @user = user
    end

    def reroute(to:)
      Handler.handler_for(to:, message:).call(bot:, message:, user:)
    end

    def reply(text:, reply_markup: nil)
      bot.api.send_message(chat_id: message.chat.id, text:)
    end

    def menu(*keys, one_time: true)
      Menu.for(*keys, one_time:)
    end

    def clear
      Menu.clear
    end
  end
end
