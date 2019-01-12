# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/contact_mailer/welcome
  def welcome
    ContactMailer.welcome(Freelancer.first)
  end

  # Preview this email at http://localhost:3000/rails/mailers/contact_mailer/reconfirmation
  def reconfirmation
    ContactMailer.reconfirmation
  end

end
