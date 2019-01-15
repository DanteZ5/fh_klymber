desc 'Mailing for the waiting list'

task :mailing => :environment do
  # require File.join(Rails.root, 'app', 'mailers', 'application_mailer.rb')
  # require File.join(Rails.root, 'app', 'mailers', 'contact_mailer.rb')
  # require File.join(Rails.root, 'app', 'controllers', 'application_controller.rb')
  # require File.join(Rails.root, 'app', 'controllers', 'requests_controller.rb')

# Check WaitingList's requests older than 3 months
  WaitingList.all.each do |waiting_list|
    if waiting_list.expired?
      waiting_list.request.status = 'expired'
      waiting_list.destroy
    elsif waiting_list.date + 3.months <= Date.today
      puts 'on tient quelque chose'
      ContactMailer.reconfirmation(waiting_list.request).deliver_now
      waiting_list.expired = true
    end
  end
end
