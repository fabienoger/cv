class UserMailer < ApplicationMailer
  default from: 'contact@fabienoger.com'

  def contact_form(message)
    @message = message
    mail(to: "fab-oger@live.fr", subject: "Contact form #{@message.nom}")
  end
end
