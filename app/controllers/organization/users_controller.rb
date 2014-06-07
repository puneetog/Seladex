class Organization::UsersController < ApplicationController
    before_filter :check_authorize_resource

  def index
    @org_users = OrganizationUser.all
  end

  def new
    @organization = Organization.find(params[:organization_id])
    @org_user = @organization.organization_users.new()
    @org_user.build_associations
  end

  def edit
    @org_user = OrganizationUser.find(params[:id])    
  end

  def update
    @org_user = OrganizationUser.find(params[:id])
    if @org_user.update_attributes(organization_user_params)
      flash[:message] = "User Successfully updated."
      redirect_to organization_users_path
    else
      render 'new'
    end
  end

  def create
    usr = OrganizationUser.get_org_user(params[:organization_user])
    #logger.debug(usr)
    usr_mang = OrganizationUser.get_org_user_per(params[:organization_user])
    @organization = Organization.find(params[:organization_id])
    @org_user = @organization.organization_users.new(usr)
    if @organization.valid?
      @organization.organization_managements.new(usr_mang)
      if @organization.save
        flash[:message] = "User Successfully created."
        redirect_to organization_path(@organization)
      else        
        render 'new'
      end
    else      
      render 'new'
    end
    
  end

  def destroy
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
end
