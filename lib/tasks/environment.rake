# frozen_string_literal: true

desc 'Load application environment'
task :environment do
  require './config/environment'
end
