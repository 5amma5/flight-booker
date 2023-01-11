class Passenger < ApplicationRecord
  # debating between has_one or has_many.
  # has_one is like booking a ticket without creating account
  # has_many may be easier to link to a User. Might be harder to prevent duplicate passengers from booking same flight
  belongs_to :booking
  has_one :flight, through: :booking
end
