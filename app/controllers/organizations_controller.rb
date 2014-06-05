class OrganizationsController < ApplicationController
  # load_and_authorize_resource
  before_filter :check_authorize_resource, only: [:index]

  skip_before_action :authenticate_user!, only: [:create, :new]

  def index
  	@organizations = Organization.all
  end

  def new
  	@organization = Organization.new
    @organization.build_associations
  end

  def edit
  	@organization = Organization.find(params[:id])  	 
  end

  def update
  	@organization = Organization.find(params[:id])
  	if @organization.update_attributes(organization_params)
	  	flash[:message] = "Organization Successfully updated."
	    redirect_to edit_organization_path(@organization)
	  else
	    render 'new'
	  end
  end

  def create
    password_string = get_random_string
    params[:organization][:user_password] = password_string
  	@organization = Organization.new(organization_params)
    user = OrganizationUser.new(email: organization_params[:email], name: organization_params[:name], password: password_string, 
                    password_confirmation: password_string, address: organization_params[:address], city: organization_params[:city],
                    state: organization_params[:state], zip: organization_params[:zip], country: organization_params[:country], 
                    cell_phone: organization_params[:phone], role: "organization_admin")
    @organization.users << user   
  	if @organization.save
  	  flash[:message] = "Organization Successfully created."
      redirect_to (user_signed_in? and current_user.admin?) ? organizations_path : root_path    
  	else
  	  render 'new'
  	end
  end

  
  private
  
  def organization_params
  	# binding.pry
    params.require(:organization).permit!
    # if user_signed_in? and current_user.admin? 
    #   params.require(:organization).permit(:name, :email, :manufacturer, :contact, 
    #                               :address, :city, :state, :zip, :country, 
    #                               :phone, :fax, :website, :status, :user_password)
    # else
    #   params.require(:organization).permit(:name, :email, :manufacturer, :contact, 
    #                               :address, :city, :state, :zip, :country, 
    #                               :phone, :fax, :website, :user_password)
    # end
  end

  def check_authorize_resource
    unless can? [:read], Organization
    	flash[:error] = "Access Denied"
    	redirect_to root_path
    end
  end  
end
