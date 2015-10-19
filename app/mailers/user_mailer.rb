class UserMailer < ApplicationMailer
  default from: 'fab.oger@gmail.com'

  def contact_form(message)
    @message = message
    mail(to: "fab.oger0@gmail.com", subject: "Contact form #{@message.nom}")
  end
end
