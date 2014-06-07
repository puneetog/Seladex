class OrganizationsController < ApplicationController
  # load_and_authorize_resource
  before_filter :check_authorize_resource, only: [:index]

  skip_before_action :authenticate_user!, only: [:create, :new]

  def index
  	@organizations = Organization.all
  end

  def new
  	@organization = Organization.new
    @organization.organization_admin = OrganizationAdmin.new
    2.times { @organization.organization_addresses.build }
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
  	@organization = Organization.new(organization_params)     
  	if @organization.save
  	  flash[:message] = "Organization Successfully created."
      redirect_to (user_signed_in? and current_user.admin?) ? organizations_path : root_path    
  	else
  	  render 'new'
  	end
  end

  def show
    @organization = Organization.find(params[:id])
  end

  
  private
  
  def organization_params
    params[:organization][:first_name] = params[:organization][:organization_admin_attributes][:first_name]
    params[:organization][:last_name] = params[:organization][:organization_admin_attributes][:last_name]
    params[:organization][:email] = params[:organization][:organization_admin_attributes][:email]
    params.require(:organization).permit!
  	# # binding.pry
    # params.require(:organization).permit!
    # if user_signed_in? and current_user.admin? 
    #   params.require(:organization).permit(:website, :organization_admin_attributes, :organization_addresses_attributes, :status)
    # else
      # params.require(:organization).permit(:website, :organization_admin_attributes[:first_name. :last_name, :email, :password, :password_confirmation], :organization_addresses_attributes)
    # end
  end

  def check_authorize_resource
    unless can? [:read], Organization
    	flash[:error] = "Access Denied"
    	redirect_to root_path
    end
  end  
end
