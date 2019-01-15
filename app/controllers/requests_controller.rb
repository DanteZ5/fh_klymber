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

    if Request.accepted.count < 20 && WaitingList.count == 0
      @request.accept!
    else
      WaitingList.create(request: @request, date: Date.today)
      @request.status = 'confirmed'
    end
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
