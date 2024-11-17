# frozen_string_literal: true

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup'
Bundler.require(ENV.fetch('APP_ENV', :development))

require 'bootsnap/setup'
