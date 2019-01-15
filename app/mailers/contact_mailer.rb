class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.welcome.subjectw
  #
  def welcome(request)
    @request = request
    mail to: request.email, subject: "Bienvenue #{request.name}"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.reconfirmation.subject
  #
  def reconfirmation(request)
    @request = request
    mail to: request.email, subject: "C'est bientôt ton tour"
  end
end
