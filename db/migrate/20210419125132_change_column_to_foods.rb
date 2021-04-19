class ChangeColumnToFoods < ActiveRecord::Migration[6.1]
  def change
    remove_column :foods, :date
    remove_column :foods, :unit
  end
end
