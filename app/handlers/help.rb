# frozen_string_literal: true

require './app/handlers/base'

module Handlers
  class Help < Base
    def call
      reply(text: response)
    end

    def response
      [
        "/help -  Помощь",
        "/start - Начало",
        "/menu -  Профиль",
        "/join -  Вступить в игру",
        "/wish -  Указать свое желание"
      ].join("\n")
    end
  end
end
