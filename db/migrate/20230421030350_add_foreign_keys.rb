class AddForeignKeys < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key "bookings", "flights", name: "bookings_flight_id_fk"
    add_foreign_key "flights", "airlines", name: "flights_airline_id_fk"
    add_foreign_key "flights", "airports", column: "arrive_id", name: "flights_arrive_id_fk"
    add_foreign_key "flights", "airports", column: "depart_id", name: "flights_depart_id_fk"
    add_foreign_key "passengers", "bookings", name: "passengers_booking_id_fk"
  end
end
