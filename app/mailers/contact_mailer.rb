class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.welcome.subject
  #
  def welcome(freelancer)
    @freelancer = freelancer
    mail to: freelancer.email, subject: "Bienvenue #{freelancer.name}"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.reconfirmation.subject
  #
  def reconfirmation
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
