# frozen_string_literal: true

require 'semantic_logger'

SemanticLogger.default_level = Application.config.log_level

if Application.config.log_sync
  $stdout.sync = true
  SemanticLogger.sync!
end

if Application.config.log_to_stdout
  SemanticLogger.add_appender(
    io:          $stdout,
    formatter:   Application.config.log_format,
    application: Application.name)
else
  SemanticLogger.add_appender(
    file_name:   Application.config.log_file_name,
    formatter:   Application.config.log_format,
    application: Application.name)
end

Application.config.logger = SemanticLogger
