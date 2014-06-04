class Admin::StoresController < ApplicationController

   # load_and_authorize_resource
  before_filter :check_authorize_resource, only: [:index]

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
	    redirect_to edit_admin_store_path(@store)
	  else
	    render 'new'
	  end
  end

  def create
    password_string = get_random_string
    params[:store][:user_password] = password_string
  	@store = Store.new(store_params)
    user = User.new(email: store_params[:email], name: store_params[:name], password: password_string, 
                    password_confirmation: password_string, address: store_params[:address], city: store_params[:city],
                    state: store_params[:state], zip: store_params[:zip], country: store_params[:country], 
                    cell_phone: store_params[:phone], role: "store_admin")
    @store.users << user   
  	if @store.save
  	  flash[:message] = "Store Successfully created."
      redirect_to (user_signed_in? and current_user.admin?) ? admin_stores_path : root_path    
  	else
  	  render 'new'
  	end
  end

  
  private
  def store_params
  	# binding.pry  	   
    if user_signed_in? and current_user.admin? 
      params.require(:store).permit(:name, :email, :manufacturer, :contact, 
                                  :address, :city, :state, :zip, :country, 
                                  :phone, :fax, :website, :status, :user_password)
    else
       params.require(:store).permit(:name, :email, :manufacturer, :contact, 
                                  :address, :city, :state, :zip, :country, 
                                  :phone, :fax, :website, :user_password)
    end
  end

  def check_authorize_resource
    unless can? [:read], Store
    	flash[:error] = "Access Denied"
    	redirect_to root_path
    end
  end  

end
