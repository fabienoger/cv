class UserMailer < ApplicationMailer
  default from: 'contact@fabienoger.com'

  def contact_form()
    mail(to: "fab-oger@live.fr", subject: 'Contact form')
  end
end
