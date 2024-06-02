json.extract! bike_ride, :id, :kilojoules, :total_elevation_gain, :distance, :average_heartrate, :average_watts, :moving_time, :weighted_average_watts, :average_cadence, :average_speed, :elapsed_time, :prediction, :user_id, :created_at, :updated_at
json.url bike_ride_url(bike_ride, format: :json)
