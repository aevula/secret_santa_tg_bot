# frozen_string_literal: true

require './app/handlers/base'

module Handlers
  class Home < Base
    def call
      return reroute(to: :start) unless user

      reply(text: response, reply_markup:)
    end

    def response
      response = ["#{user.first_name} #{user.last_name} (@#{user.username})", "Желание: #{user.wish}"]
      reponse.push("Твой пиздюк: #{user.receiver}") if User.distributed?
      response.join("\n")
    end

    def reply_markup
      menu(:home, :wish)
    end
  end
end
