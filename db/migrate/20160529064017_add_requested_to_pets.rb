class AddRequestedToPets < ActiveRecord::Migration
  def change
    add_column :pets, :requested, :boolean
  end
end
