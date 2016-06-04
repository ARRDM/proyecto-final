class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :pet, index: true, foreign_key: true
      t.integer :petitioner
      t.integer :owner

      t.timestamps null: false
    end
  end
end
