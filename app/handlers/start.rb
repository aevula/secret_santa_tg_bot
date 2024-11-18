# frozen_string_literal: true

require './app/handlers/base'

module Handlers
  class Start < Base
    def call
      return reroute(to: :home) if user

      reply(text: "Печатниковский Секретный Санта.\nВведи `join`, чтобы вступить", reply_markup:)
    end

    def reply_markup
      menu(:join)
    end
  end
end
