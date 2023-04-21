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
  { code: "ORD", name: "Chicago O'Hare International Airport" },
  { code: "DFW", name: "Dallas/Fort Worth International Airport" },
  { code: "PHX", name: "Phoenix Sky Harbor International Airport" }
]

airlines = [
  { code: "DL", name: "Delta Airlines" },
  { code: "AA", name: "American Airlines" },
  { code: "F9", name: "Frontier Airlines" }
]

airports.each do |airport| 
  Airport.create(airport)
end

airlines.each do |airline|
  Airline.create(airline)
end

ap_1 = Airport.where(code: "ORD").first
ap_2 = Airport.where(code: "PHX").first
al_1 = Airline.where(code: "DL").first
al_2 = Airline.where(code: "F9").first

flights = [
  { depart_id: ap_1.id, arrive_id: ap_2.id, airline_id: al_1.id, start_date_time: "2023-04-19 07:00", duration_min: 120 },
  { depart_id: ap_1.id, arrive_id: ap_2.id, airline_id: al_2.id, start_date_time: "2023-04-19 13:00", duration_min: 500 }
]

flights.each do |flight|
  Flight.create(flight)
end

fl_1 = Flight.where(start_date_time: "2023-04-19 07:00").first

bookings = [
  { flight_id: fl_1.id }
]

bookings.each do |booking|
  Booking.create(booking)
end

bk_1 = Booking.where(flight_id: fl_1.id).first

passengers = [
  { name: "Sam", email: "sam1234@gmail.com", booking_id: bk_1.id },
  { name: "Ali", email: "ali_xx@hotmail.com", booking_id: bk_1.id },
  { name: "Jack", email: "notjack@gmail.com", booking_id: bk_1.id }
]

passengers.each do |passenger|
  Passenger.create(passenger)
end
