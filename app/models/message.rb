class Message < ActiveRecord::Base
  belongs_to :pet

 # def make_new_text(text)
  #	Text.create(message_id: self, user_id: self.petitioner, read: false, message: text)
  #end
end
