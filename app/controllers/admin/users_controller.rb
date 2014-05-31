class Admin::UsersController < ApplicationController
  # load_and_authorize_resource

  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def edit
  	@user = User.find(params[:id])  	 
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update_attributes(user_params)
	  	flash[:message] = "User Successfully updated."
	    redirect_to admin_users_path
	  else
	    render 'new'
	  end
  end

  def create
  	 @user = User.new(user_params)
  	if @user.save
	  	flash[:message] = "User Successfully created."
	    redirect_to admin_users_path
	  else
	    render 'new'
	  end
  end

  def destroy
  end
  
  private
  def user_params
  	# binding.pry
  	 
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
  end
end
