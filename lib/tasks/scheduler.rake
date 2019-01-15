desc 'Mailing for the waiting list'

task :mailing do
  require File.join(Rails.root, 'app', 'mailers', 'application_mailer.rb')
  require File.join(Rails.root, 'app', 'mailers', 'contact_mailer.rb')
  require File.join(Rails.root, 'app', 'controllers', 'application_controller.rb')
  require File.join(Rails.root, 'app', 'controllers', 'requests_controller.rb')

# Check WaitingList's requests older than 3 months
  WaitingList.all.each do |request|
    if request.date + 3.months >= Date.today
      ContactMailer.reconfirmation(request.request).deliver_now
      request.expired = true
    end
  end
end
