# frozen_string_literal: true

module Menu
  def self.for(*keys, one_time: false)
    keyboard = Array.wrap(keys).map { |key| [{ text: key.to_s }] }
    Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard:, one_time_keyboard: one_time)
  end

  def self.clear
    Telegram::Bot::Types::ReplyKeyboardRemove.new(remove_keyboard: true)
  end
end
