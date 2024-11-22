# frozen_string_literal: true

require './app/handlers/base'

module Handlers
  class Home < Base
    def call
      return reroute(to: :start) unless user

      show_profile
    end

    def show_profile
      wish_text = user.wish.force_encoding('utf-8')
      response = ["#{user.first_name} #{user.last_name} (@#{user.username})", "Желание: #{wish_text}"]
      reponse.push("Твой пиздюк: #{user.receiver}") if User.distributed?
      reply(text: response.join("\n"), reply_markup:)
    end

    def reply_markup
      menu(:home, :wish)
    end
  end
end
