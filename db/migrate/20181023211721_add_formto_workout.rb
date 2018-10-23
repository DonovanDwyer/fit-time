class AddFormtoWorkout < ActiveRecord::Migration[5.2]
  def change
    add_column :workouts, :form, :string
    add_column :workouts, :function, :string
  end
end
