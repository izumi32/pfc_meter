class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.string :food_name
      t.integer :protein
      t.integer :fat
      t.integer :carbohydrate
      t.string :remarks

      t.timestamps
    end
  end
end
