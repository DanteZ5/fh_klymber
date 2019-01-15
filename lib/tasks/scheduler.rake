desc 'Mailing for the waiting list'

task :mailing do
  require File.join(Rails.root, 'app', 'services', 'daily_service.rb')
  DailyService.new.call
end
