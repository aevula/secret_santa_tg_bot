# frozen_string_literal: true

require 'telegram/bot'

require './app/user'

require 'require_all'
require_all './app/handlers'

class Handler
  HANDLERS = {
    help:    Handlers::Help,
    start:   Handlers::Start,
    home:    Handlers::Home,
    join:    Handlers::Join,
    wish:    Handlers::Wish,
    unknown: Handlers::Unknown
  }.freeze
  private_constant :HANDLERS

  def self.handler_for(message:, to: nil)
    HANDLERS[to] || HANDLERS.fetch(message.text.to_s.delete('/').to_sym, HANDLERS[:unknown])
  end

  attr_reader :bot

  def initialize(bot)
    @bot = bot
  end

  def call(message:)
    user = User.find_by(telegram_id: message.from.id)

    handler = handler_for(message:)

    handler.call(bot:, message:, user:)
  rescue StandardError => e
    SemanticLogger['Bot'].tagged(Thread.current['uuid']) { _1.error(e) }
    bot.api.reply(chat_id: message.chat_id, text: "Ошибочка, отправь идиоту код\n#{Thread.current['uuid']}")
  end

  private

  def handler_for(message:, to: nil)
    self.class.handler_for(to:, message:)
  end
end
