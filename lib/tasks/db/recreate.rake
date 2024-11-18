# frozen_string_literal: true

namespace :db do
  desc 'Recreate DB'
  task recreate: %i[environment drop prepare]
end
