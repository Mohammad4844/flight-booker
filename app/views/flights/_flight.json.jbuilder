json.extract! flight, :id, :depart_id, :arrive_id, :airline_id, :start_date_time, :duration_min, :created_at, :updated_at
json.url flight_url(flight, format: :json)
