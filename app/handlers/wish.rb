# frozen_string_literal: true

require './app/handlers/base'

module Handlers
  class Wish < Base
    def call
      return reroute(to: :start) unless user

      user.wishing? ? save_wish : prompt_wish
    end

    private

    def save_wish
      user.update!(wish: message.text, wishing: false)
      reply(text: 'Твое желание было обновлено', reply_markup:)
    end

    def prompt_wish
      user.update!(wishing: true)
      reply(text: 'А теперь введи свое желание на этот Новый Год', reply_markup: clear)
    end

    def reply_markup
      menu(:home, :wish)
    end
  end
end
