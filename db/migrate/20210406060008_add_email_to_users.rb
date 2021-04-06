class AddEmailToUsers < ActiveRecord::Migration[6.1]
  def up
    remove_column :users, :eail, :string
  end

  def down
    add_column :users, :email, :string
  end
end
