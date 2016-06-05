class PostMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.post_mailer.UserMailer.subject
  #
  def cuenta_mensaje(user,actual)
    #@user = user
    #@actual = actual
    #mail to: user.email, subject: "Tienes una solicitud"
  end
   
  
  def UserMailer(dest,nombre,email,phone,actual)
    @nombre = nombre
    @email = email
    @phone = phone    
    @actual = actual
    mail to: "#{dest}"
  end
  
end
