class Admin::StoresController < ApplicationController

   # load_and_authorize_resource
  before_filter :check_authorize_resource

  def index
  	@stores = Store.all
  end

  def new
  	@store = Store.new
  end

  def edit
  	@store = Store.find(params[:id])  	 
  end

  def update
  	@store = Store.find(params[:id])
  	if @store.update_attributes(store_params)
	  	flash[:message] = "Store Successfully updated."
	    redirect_to admin_stores_path
	  else
	    render 'new'
	  end
  end

  def create
  	 @store = Store.new(store_params)
  	if @store.save
  	  flash[:message] = "Store Successfully created."
      redirect_to admin_stores_path
	else
	  render 'new'
	end
  end

  
  private
  def store_params
  	# binding.pry  	 
    params.require(:store).permit(:name, :email, :password, :password_confirmation, :role)
  end

  def check_authorize_resource
    unless can? :create, Store
    	flash[:error] = "Access Denied"
    	redirect_to root_path
    end
  end

end
