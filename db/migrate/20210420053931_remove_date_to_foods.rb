class RemoveDateToFoods < ActiveRecord::Migration[6.1]
  def change
    remove_column :foods, :date
  end
end
