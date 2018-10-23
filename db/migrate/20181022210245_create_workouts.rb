class CreateWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :workouts do |t|
      t.integer :user_id
      t.string :description
      t.string :name
      t.integer :rating
      t.integer :total_time

      t.timestamps
    end
  end
end
