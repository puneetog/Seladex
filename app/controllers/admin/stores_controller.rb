class Admin::StoresController < ApplicationController

   # load_and_authorize_resource
  before_filter :check_authorize_resource
  skip_before_action :authenticate_user!, only: [:create, :new]

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
  	store = Store.new(store_params)
    user = User.new(email: store_params[:email], name: store_params[:name])
  	if store.save
  	  flash[:message] = "Store Successfully created."
      redirect_to (user_signed_in? and current_user.admin?) ? admin_stores_path : root_path       
	else
	  render 'new'
	end
  end

  
  private
  def store_params
  	# binding.pry  	 
    params.require(:store).permit(:name, :email, :manufacturer, :contact, 
                                  :address, :city, :state, :zip, :country, 
                                  :phone, :fax, :website)
  end

  def check_authorize_resource
    if can? [:read], Store
    	flash[:error] = "Access Denied"
    	redirect_to root_path
    end
  end

end
