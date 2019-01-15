desc 'Mailing for the waiting list'

task :mailing do
  require 'contact_mailer.rb'
  ContactMailer.welcome(Request.first).deliver_now
end
