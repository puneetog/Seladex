class Admin::UsersController < ApplicationController
  # load_and_authorize_resource
  before_filter :check_authorize_resource

  def index
  	@users = User.all
  end

  def new
  	@user = User.new
    @user.build_associations
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
      logger.debug ":::::::::::::::::::::::::"
      logger.debug params[:user]
      # param = params["user"]["user_store_managements_attributes"] 
      # @user.save_store_permisions(param)
      
  	if @user.save
  	  flash[:message] = "User Successfully created."
      redirect_to admin_users_path
  	else
      logger.debug("erors")
      logger.debug(@user.errors.full_messages)
  	  render 'new'
  	end
  end

  def destroy
  end
  
  private
  def user_params
    params.require(:user).permit!
    # (:name, :email, :password, :password_confirmation, :role, :last_name, :initial, :address, :city, :state, :country, :zip, :cell_phone, :home_phone, user_store_managements_attributes: [:id, :contact, :order, :invoice, :commission, :user_rep])
  end

  def check_authorize_resource
    unless can? :create, User
    	flash[:error] = "Access Denied"
    	redirect_to root_path
    end
  end
end
