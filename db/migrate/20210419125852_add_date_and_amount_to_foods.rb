class AddDateAndAmountToFoods < ActiveRecord::Migration[6.1]
  def change
    add_column :foods, :date, :time
  end
end
