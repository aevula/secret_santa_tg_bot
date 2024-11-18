# frozen_string_literal: true

require './app/bot'

desc 'Runs application telegram bot'
task run: :environment do
  Bot.new.call(token: ENV.fetch('TELEGRAM_BOT_TOKEN'))
end
