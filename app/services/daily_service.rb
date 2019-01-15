class DailyService
  require File.join(Rails.root, 'app', 'mailers', 'contact_mailer.rb')
  def call

    ContactMailer.welcome(Request.first).deliver_now
  end
end
