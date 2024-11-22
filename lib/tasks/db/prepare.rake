# frozen_string_literal: true

namespace :db do
  desc 'Prepare DB'
  task prepare: %i[environment create] do
    db_config = Application.config.db_config
    ActiveRecord::Base.establish_connection(db_config)
    ActiveRecord::Base.connection.create_table(:users, id: false) do |table|
      table.string(:telegram_id, primary_key: true)
      table.string(:username, null: false)
      table.string(:first_name)
      table.string(:last_name)

      table.boolean(:wishing, null: false, default: false)

      table.text(:wish)
      table.string(:receiver_id)

      table.timestamps
    end
  end
end
