# frozen_string_literal: true

namespace :db do
  desc 'Drop DB'
  task drop: :environment do
    raise(ArgumentError) if ENV.fetch('DROP_IT', false) != 'true' && Application.config.production?

    db_config = Application.config.db_config
    db_config_admin = db_config.merge(database: 'postgres', schema_search_path: 'public')
    ActiveRecord::Base.establish_connection(db_config_admin)
    ActiveRecord::Base.connection.drop_database(db_config.fetch(:database))
  end
end
