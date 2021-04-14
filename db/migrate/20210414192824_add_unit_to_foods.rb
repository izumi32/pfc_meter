class AddUnitToFoods < ActiveRecord::Migration[6.1]
  def change
    add_column :foods, :unit, :integer
  end
end
