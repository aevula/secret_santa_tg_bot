# frozen_string_literal: true

require './app/handlers/base'

module Handlers
  class Unknown < Base
    def call
      return reroute(to: :start) unless user
      return reroute(to: :wish) if user&.wishing?

      reply(text: "Команда не распознана :(\nПопробуй еще раз", reply_markup:)
    end

    def reply_markup
      menu(:home, :wish)
    end
  end
end
