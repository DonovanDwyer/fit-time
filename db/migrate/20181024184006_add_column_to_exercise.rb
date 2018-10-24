class AddColumnToExercise < ActiveRecord::Migration[5.2]
  def change
    add_column :exercises, :body_part, :string
  end
end
