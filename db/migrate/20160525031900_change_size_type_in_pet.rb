class ChangeSizeTypeInPet < ActiveRecord::Migration
  def up
    change_column :pets, :size, :string
  end

  def down
    change_column :pets, :size, :integer
  end
end
