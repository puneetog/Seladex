class Organization::BrandsController < ApplicationController
  before_filter :check_authorize_resource
	before_filter :organization_brand

  def index
    @org_users = Brand.all
  end

  def show 
  	@brand = Brand.find(params[:id])
  end

  def new   
    @brand =Brand.new()   
  end

  def edit
    @brand = Brand.find(params[:id])    
  end

  def update
    @brand = Brand.find(params[:id])
    if @brand.update_attributes(brand_params)
      flash[:message] = "Brand Successfully updated."
      redirect_to organization_path(@brand.organization)
    else
      render 'new'
    end
  end

  def create
    # usr = OrganizationUser.get_org_user(params[:organization_user])
    # #logger.debug(usr)
    # usr_mang = OrganizationUser.get_org_user_per(params[:organization_user])
    @organization = Organization.find(params[:organization_id])
    @brand = @organization.brands.new(brand_params)    
	  if @organization.save
	    flash[:message] = "Brand Successfully created."
	    redirect_to organization_path(@organization)
	  else        
	    render 'new'
	  end
    
    
  end

  def destroy
  end
  
  private
  
  def brand_params
    # params.require(:organization_brand).permit!
    params.require(:brand).permit(:name, :description, :commission_rate, :territory)
  end

  def check_authorize_resource
    unless can? :create, Brand
      flash[:error] = "Access Denied"
      redirect_to root_path
    end
  end

  def organization_brand
    @organization = Organization.find(params[:organization_id]) if params[:organization_id].present?
  end

end
