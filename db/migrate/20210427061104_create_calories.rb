class CreateCalories < ActiveRecord::Migration[6.1]
  def change
    create_table :calories do |t|

      t.integer :protein
      t.integer :fat
      t.integer :carbohydrate
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
