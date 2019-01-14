class RequestsController < ApplicationController

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    @request.status = "unconfirmed"
    @request.key = (0...10).map { (65 + rand(26)).chr }.join
    if @request.save
      welcome_email(@request)
      flash[:notice] = "Vas voir tes mails et confirme 🤘"
      redirect_to root_path
    else
      render :new
    end
  end

  def confirmation
    @request = Request.find_by(key: params[:key])
    @request.status = 'confirmed'
    @request.save
  end

  private

  def request_params
    params.require(:request).permit(:name, :email, :phone, :bio)
  end

  def welcome_email(request)
    ContactMailer.welcome(request).deliver_now
  end
end
