class AddColumnsToExercises < ActiveRecord::Migration[5.2]
  def change
    add_column :exercises, :muscle_one, :string
    add_column :exercises, :muscle_two, :string
    add_column :exercises, :equipment, :string
    add_column :exercises, :comment, :string
  end
end
