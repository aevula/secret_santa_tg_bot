# frozen_string_literal: true

require './config/boot'

require 'ostruct'
require 'require_all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :p.roduction.
Bundler.require

module Application
  def self.config
    @config ||= OpenStruct.new
  end

  def self.load
    config.loaded ||= begin
      require_all 'config/application'
      require_all 'config/initializers'
      require_all 'lib'
      require_all 'app'
      true
    end
  end
end
