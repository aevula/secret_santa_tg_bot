# frozen_string_literal: true

require 'active_record'
require 'erb'

require './config/application/environment'

module Application
  db_config = ERB.new(File.read('./config/database.yml')).result
  config.db_config = YAML.load(db_config, aliases: true).fetch(config.app_env.to_s).symbolize_keys
  config.db_connection = ActiveRecord::Base.establish_connection(config.db_config)
end
