class AddColumnToFoods2 < ActiveRecord::Migration[6.1]
  def change

    add_column :foods, :amount, :integer
    
  end
end
