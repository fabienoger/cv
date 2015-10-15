class UserMailer < ApplicationMailer
  default from: 'contact@fabienoger.com'

  def contact_form(message)
    @message = message
    mail(to: "spodze@gmail.com", subject: "Contact form #{@message.nom}")
  end
end
