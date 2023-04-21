# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Passenger.delete_all
Booking.delete_all
Flight.delete_all
Airport.delete_all
Airline.delete_all

airports = [
  { code: "CLT", name: "Charlotte Douglas International Airport" },
  { code: "DEN", name: "Denver International Airport" },
  { code: "DFW", name: "Dallas/Fort Worth International Airport" },
  { code: "JFK", name: "John F. Kennedy International Airport" },  
  { code: "MIA", name: "Miami International Airport" },
  { code: "ORD", name: "Chicago O'Hare International Airport" },
  { code: "PHX", name: "Phoenix Sky Harbor International Airport" },  
]

airlines = [
  { code: "AA", name: "American Airlines" },
  { code: "AS", name: "Alaska Airlines" },
  { code: "DL", name: "Delta Airlines" },
  { code: "FL", name: "Air Tran" },
  { code: "UA", name: "United Airlines" },
  { code: "WN", name: "Southwest Airlines" },
]

airports.each do |airport| 
  Airport.create(airport)
end

airlines.each do |airline|
  Airline.create(airline)
end

today = Date.today

(0..6).each do |i|
  date = today + i
  rand(2..5).times do |j|
    hour = rand(0..23)
    minute = rand(0..11) * 5
    second = 0
    datetime = DateTime.new(date.year, date.month, date.day, hour, minute, second)

    duration = rand(10..60) * 5
  
    airport_ids = Airport.pluck(:id).sample(2)
    airline_id = Airline.pluck(:id).sample(1).first
    
    Flight.create({ depart_id: airport_ids[0], arrive_id: airport_ids[1], airline_id: airline_id,
       start_date_time: datetime, duration_min: duration })
  end
end
