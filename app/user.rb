# frozen_string_literal: true

require 'active_record'

class User < ActiveRecord::Base
  self.primary_key = :telegram_id

  validates :telegram_id, presence: true
  validates :username,    presence: true
  validates :first_name,  presence: true
  validates :last_name,   presence: true
  validates :wish,        presence: true, if: -> { wishing? && !wishing_changed? }
  validates :receiver_id, presence: true, if: -> { self.class.distributed? }

  def self.distributed?
    Time.zone.now > Time.new(2024, 11, 30, nil, nil, nil, Time.zone)
  end
end
