class CreateBikeRides < ActiveRecord::Migration[7.1]
  def change
    create_table :bike_rides do |t|
      t.float :kilojoules
      t.float :total_elevation_gain
      t.float :distance
      t.float :average_heartrate
      t.float :average_watts
      t.float :moving_time
      t.float :weighted_average_watts
      t.float :average_cadence
      t.float :average_speed
      t.float :elapsed_time
      t.float :prediction
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
