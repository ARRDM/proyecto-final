class AddReadToText < ActiveRecord::Migration
  def change
    add_column :texts, :read, :boolean
  end
end
