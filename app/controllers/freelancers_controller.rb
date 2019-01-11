class FreelancersController < ApplicationController

  def new
    @freelancer = Freelancer.new
  end

  def create
    @freelancer = Freelancer.new(freelancer_params)
    @freelancer.confirmed = false
    if @freelancer.save
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
end
