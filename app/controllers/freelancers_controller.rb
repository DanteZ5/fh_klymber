class FreelancersController < ApplicationController

  def new
    @freelancer = Freelancer.new
  end

  def create
    @freelancer = Freelancer.new(freelancer_params)
    @freelancer.confirmed = false
    @freelancer.key = (0...10).map { (65 + rand(26)).chr }.join
    if @freelancer.save
      # welcome_email(@freelancer)
      flash[:notice] = "Vas voir tes mails et confirme 🤘"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def freelancer_params
    params.require(:freelancer).permit(:name, :email, :phone, :bio)
  end

  # def welcome_email(freelancer)
  #   ContactMailer.welcome(freelancer).deliver_now
  # end
end
