class WelcomeController < ApplicationController
  def home
  	@pets = Pet.all.order('created_at DESC').take(4)
  end
end
