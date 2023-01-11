class Booking < ApplicationRecord
  belongs_to :flight
  has_one :passenger
end
