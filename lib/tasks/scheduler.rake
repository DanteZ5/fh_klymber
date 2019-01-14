desc 'Mailing for the waiting list'

task :mailing do
  ContactMailer.welcome(Request.first).deliver_now
end
