class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.string :breed
      t.string :hair
      t.string :age
      t.string :gender
      t.integer :size
      t.text :description
      t.boolean :status

      t.timestamps null: false
    end
  end
end
