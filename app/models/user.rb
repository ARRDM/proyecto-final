# coding: utf-8
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :password, :format => {:with => /(?=.*\d)(?=.*[a-z])(?=.*[A-Z])/, message: "Tiene que tener al menos 8 caracteres, una letra y una letra en mayúscula."}
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :pets
  geocoded_by :address
  after_validation :geocode
  
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      return user
    else
      registered_user = User.where(:email => auth.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(user_name:auth.extra.raw_info.name,
                           provider:auth.provider,
                           uid:auth.uid,
                           email:auth.info.email,
                           password:Devise.friendly_token[0,20])
      end
    end
  end
end
