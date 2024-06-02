class CreatePredictions < ActiveRecord::Migration[7.1]
  def change
    create_table :predictions do |t|
      t.references :bike_ride, null: false, foreign_key: true
      t.float :prediction

      t.timestamps
    end
  end
end
