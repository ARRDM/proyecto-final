class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_name, :string
    add_column :users, :user_lastname_p, :string
    add_column :users, :user_lastname_m, :string
    add_column :users, :phone, :string
  end
end
