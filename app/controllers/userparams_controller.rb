class UserparamsController < ApplicationController
	before_action :authenticate_user!
  def show
  end
  def new
  	@userparam = Userparam.new
  end
  def create
  	@userparam = current_user.build_userparam(profile_params)
  	  if @userparam.save
  		redirect_to userparam_path(@userparam.id)
  	  end
    else
      render 'new'
      
  	end
  def edit
    @userparam = current_user.userparam
  end
  def update
    @userparam = Userparam.find_by(user_id: current_user.id)
     if @userparam.update(profile_params)
      redirect_to userparam_path(@userparam.id)
    else
      render 'new'

     end
  end
  def destroy
  end
  private
  def profile_params
  	params.require(:userparam).permit(:user_id, :firstname, :lastname, :age, :avatar)
  end

end
