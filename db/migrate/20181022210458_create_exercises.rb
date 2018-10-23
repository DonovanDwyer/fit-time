class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :form
      t.integer :part
      t.string :function
      t.string :instructions
      t.integer :time

      t.timestamps
    end
  end
end
