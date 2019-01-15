class DailyService
  def call
    ContactMailer.welcome(Request.first).deliver_now
  end
end
