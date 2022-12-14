class Airport < ApplicationRecord
  has_many :flight_departures, class_name: 'Flight',
                               foreign_key: 'departure_id',
                               dependent: :destroy,
                               inverse_of: :departure_airport
  has_many :flight_arrivals, class_name: 'Flight',
                             foreign_key: 'arrival_id',
                             dependent: :destroy,
                             inverse_of: :arrival_airport
end
