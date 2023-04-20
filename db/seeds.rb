# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Airport.delete_all
Airline.delete_all
Flight.delete_all

Airport.create(code: "ORD", name: "Chicago O'Hare International Airport")
Airport.create(code: "DFW", name: "Dallas/Fort Worth International Airport")
Airport.create(code: "PHX", name: "Phoenix Sky Harbor International Airport")

Airline.create(code: "DL", name: "Delta Airlines")
Airline.create(code: "AA", name: "American Airlines")
Airline.create(code: "F9", name: "Frontier Airlines")

a = Airport.where(code: "ORD").first
b = Airport.where(code: "PHX").first
c = Airline.where(code: "DL").first
d = Airline.where(code: "F9").first


Flight.create(depart_id: a.id, arrive_id: b.id, airline_id: c.id, start_date_time: "2023-04-19 07:00", duration_min: 120)
Flight.create(depart_id: a.id, arrive_id: b.id, airline_id: d.id, start_date_time: "2023-04-19 13:00", duration_min: 500)