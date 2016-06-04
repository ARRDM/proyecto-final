class ChangeTextTypeInMessages < ActiveRecord::Migration
  
  	def up
  		change_column :messages, :text, :string
  	end
  	def down
  		change_column :messages, :text, :text
  	end
  
end
