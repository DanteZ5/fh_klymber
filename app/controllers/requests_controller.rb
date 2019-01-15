require 'date'

class RequestsController < ApplicationController
  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    @request.status = "unconfirmed"
    if @request.save
      welcome_email(@request)
      flash[:notice] = "Vas voir tes mails et confirme 🤘"
      redirect_to root_path
    else
      render :new
    end
  end

  def confirmation
    @request = Request.find(params[:id])

    if Request.accepted.count < 20
      @request.accept!
    elsif WaitingList.find_by(request: @request) == nil
      WaitingList.create(request: @request, date: Date.today, expired: false)
      @request.status = 'confirmed'
    end
    @request.save
  end

  def reconfirmation
    @request = Request.find(params[:id])
    @waiting_list = WaitingList.find_by(request: @request)
    @waiting_list.expired = false
    @waiting_list.date = Date.today
    @waiting_list.save
  end

  private

  def request_params
    params.require(:request).permit(:name, :email, :phone, :bio)
  end

  def welcome_email(request)
    ContactMailer.welcome(request).deliver_now
  end
end
