class AddMessageToText < ActiveRecord::Migration
  def change
    add_reference :texts, :message, index: true, foreign_key: true
  end
end
