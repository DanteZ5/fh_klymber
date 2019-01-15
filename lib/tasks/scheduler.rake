desc 'Mailing for the waiting list'

task :mailing do
  require File.join(Rails.root, 'app', 'mailers', 'application_mailer.rb')
  require File.join(Rails.root, 'app', 'mailers', 'contact_mailer.rb')
  ContactMailer.welcome(Request.first).deliver_now
end
