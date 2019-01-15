desc 'Mailing for the waiting list'

task :mailing do
  require File.join(Rails.root, 'app', 'mailers', 'application_mailer.rb')
  require File.join(Rails.root, 'app', 'mailers', 'contact_mailer.rb')
  require File.join(Rails.root, 'app', 'controllers', 'application_controller.rb')
  require File.join(Rails.root, 'app', 'controllers', 'requests_controller.rb')

# Check WaitingList's requests older than 3 months
  WaitingList.each do |request|
    p request.date
  end
end
