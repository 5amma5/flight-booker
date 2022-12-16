# frozen_string_literal: true

class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport',
                                 foreign_key: 'departure_id'
  belongs_to :arrival_airport, class_name: 'Airport',
                               foreign_key: 'arrival_id'
  has_many :bookings
  has_many :passengers, through: :bookings
end
