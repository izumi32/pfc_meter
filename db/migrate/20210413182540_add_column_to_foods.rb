class AddColumnToFoods < ActiveRecord::Migration[6.1]
  def change
    add_column :foods, :date, :datetime
  end
end
