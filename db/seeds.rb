# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Airport.destroy_all
Flight.destroy_all

Airport.create!([{
  name: "SLC"
},
{
  name: "JFK"
},
{
  name: "ORD"
},
{
  name: "ATL"
},
{
  name: "DFW"
},
{
  name: "DEN"
},
{
  name: "LAX"
},
{
  name: "LAS"
},
{
  name: "PHX"
}])

p "Created #{Airport.count} airports"

25.times do |index|
  rand_depart = Airport.ids.sample
  rand_arrive = (Airport.ids - [rand_depart]).sample
  Flight.create!(departure_id: rand_depart,
                 arrival_id: rand_arrive,
                 start: Date.today+rand(10000),
                 duration: rand(60..360))
end


p "Created #{Flight.count} flights"