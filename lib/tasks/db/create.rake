# frozen_string_literal: true

namespace :db do
  desc 'Create DB'
  task create: :environment do
    db_config = Application.config.db_config
    db_config_admin = db_config.merge(database: 'postgres', schema_search_path: 'public')
    ActiveRecord::Base.establish_connection(db_config_admin)
    ActiveRecord::Base.connection.create_database(db_config.fetch(:database))
  end
end
