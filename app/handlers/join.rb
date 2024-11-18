# frozen_string_literal: true

require './app/handlers/base'

module Handlers
  class Join < Base
    def call
      return reroute(to: :home) if user

      create_user!

      reply(text: "#{user.first_name}, ты успешно зарегистрирован", reply_markup:)
      reroute(to: :wish)
    end

    def create_user!
      @user = User.create!(
        telegram_id: message.from.id,
        username:    message.from.username,
        first_name:  message.from.first_name,
        last_name:   message.from.last_name)
    end

    def reply_markup
      menu(:join)
    end
  end
end
