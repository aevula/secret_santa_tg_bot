# frozen_string_literal: true

module Application
  DEFAULT_LOG_FORMAT = Application.config.production? ? 'json' : 'color'
  LOG_FORMATS = %w[color json].freeze
  private_constant :DEFAULT_LOG_FORMAT
  private_constant :LOG_FORMATS

  config.log_level = ENV.fetch('LOG_LEVEL', :debug).to_sym

  config.log_to_file = !ENV.fetch('LOG_TO_FILE', nil).nil?
  config.log_file_name = ENV.fetch('LOG_TO', config.log_to_file ? "log/#{config.app_env}.log" : nil)
  config.log_to_stdout = ENV.fetch('LOG_TO_STDOUT', config.log_file_name.nil?)

  config.log_sync = ENV.fetch('LOG_SYNC', false)

  log_format = ENV.fetch('LOG_FORMAT', DEFAULT_LOG_FORMAT)
  log_format = DEFAULT_LOG_FORMAT unless LOG_FORMATS.include?(log_format)
  config.log_format = log_format.to_sym
end
