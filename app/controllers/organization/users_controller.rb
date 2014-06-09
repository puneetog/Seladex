class Organization::UsersController < ApplicationController
    before_filter :check_authorize_resource
    before_filter :process_brands_attrs, only: [:create, :update]
    before_filter :organization_user

  def index
    @org_users = OrganizationUser.all
  end

  def new
    @organization = Organization.find(params[:organization_id])
    @org_user = @organization.organization_users.new()
    # @org_user.build_associations
  end

  def edit
    @organization = Organization.find(params[:organization_id])
    @org_user = OrganizationUser.find(params[:id])
  end

  def update
    @organization = Organization.find(params[:organization_id])
    @org_user = OrganizationUser.find(params[:id])
    if @org_user.update_attributes(organization_user_params)
      flash[:message] = "User Successfully updated."
      redirect_to organization_organization_user_path(@organization, @org_user)
    else
      render 'new'
    end
  end

  def create
    # usr = OrganizationUser.get_org_user(params[:organization_user])
    # usr_mang = OrganizationUser.get_org_user_per(params[:organization_user])
    # logger.debug(usr_mang)
    @organization = Organization.find(params[:organization_id])
    @org_user = @organization.organization_users.new(organization_user_params)   
    # @org_user.organization_managements.organization = @organization
    #if @organization.valid?
      #@organization.organization_managements.new(usr_mang)
      if @org_user.save
        org = @org_user.organization_managements.last
        org.organization_id = @organization.id
        if !org.save
          logger.debug("errors")
          logger.debug(org.errors.full_messages)
        end
        flash[:message] = "User Successfully created."
        redirect_to organization_path(@organization)
      # else        
      #   render 'new'
      # end
    else      
      render 'new'
    end
    
  end

  def show
    @organization = Organization.find(params[:organization_id])
    @org_user = OrganizationUser.find(params[:id])
    @role = @org_user.role
    @role_fields = ["edit", "create", "delete", "view"]
  end

  def destroy
    @org_user = OrganizationUser.find(params[:id])   
    @org_user.destroy
    redirect_to organization_path(@organization)
  end

  private
  def organization_user_params
    params.require(:organization_user).permit!
    # params.require(:organization_user).permit(:first_name, :email, :password, :password_confirmation, :last_name, organization_managements_attributes: [:contact, :orders, :invoice, :commission, :user_rep])
  end

  def check_authorize_resource
    unless can? :create, User
      flash[:error] = "Access Denied"
      redirect_to root_path
    end
  end

  def process_brands_attrs
    params[:organization_user][:organization_user_brands_attributes].values.each do |brand_attr|
      brand_attr[:_destroy] = true if brand_attr[:enable] != '1'
    end
  end

   def organization_user
    @organization = Organization.find(params[:organization_id]) if params[:organization_id].present?
  end

end
