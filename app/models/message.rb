class Message < ActiveRecord::Base
  belongs_to :pet

  #scope :personal, -> {where("owner = ? OR petitioner = ?", current_user.id, current_user.id)}
  # Arreglar metodos TODAY
  #scope :hoy, -> { where(created_at: Date.today) }
  #scope :pendiente, -> {where(pending: true)}
  scope :recientes, -> {order("created_at DESC")}
 # def make_new_text(text)
  #	Text.create(message_id: self, user_id: self.petitioner, read: false, message: text)
  #end
  def self.personal(user)
    where("owner = ? OR petitioner = ?", user, user)
  end
end
