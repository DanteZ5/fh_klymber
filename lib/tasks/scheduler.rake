desc 'Mailing for the waiting list'

task :mailing => :environment do
# Check WaitingList's requests older than 3 months
  if WaitingList.all != []
    until Request.accepted.count == 20
        WaitingList.first.request.accept!
        WaitingList.first.request.save
        WaitingList.first.destroy
    end
  end

  WaitingList.all.each do |waiting_list|
    if waiting_list.expired?
      waiting_list.request.status = 'expired'
      waiting_list.destroy
    elsif waiting_list.date + 3.months <= Date.today
      ContactMailer.reconfirmation(waiting_list.request).deliver_now
      waiting_list.expired = true
    end
  end
end
