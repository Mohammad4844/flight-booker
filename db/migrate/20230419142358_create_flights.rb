class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.integer :depart_id
      t.integer :arrive_id
      t.integer :airline_id
      t.datetime :start_date_time
      t.integer :duration_min

      t.timestamps
    end
  end
end
