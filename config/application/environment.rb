# frozen_string_literal: true

module Application
  config.app_env = ENV.fetch('APP_ENV', :development).to_sym

  config[:production?] = config.app_env == :production
  config[:development?] = config.app_env == :development
  config[:test?] = config.app_env == :test
  config[:ci?] = config.app_env == :ci

  config.name = :secret_santa_tg_bot
end
