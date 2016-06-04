class ChangeStatusTypeInPets < ActiveRecord::Migration
    
  	def up
  		change_column :pets, :status, :string
  	end
  	def down
  		change_column :pets, :status, :boolean
  	end
  
end
