class Organization::UsersController < ApplicationController
    # before_filter :check_authorize_resource

  def index
    @org_users = OrganizationUser.all
  end

  def new
    @organization = Organization.find(params[:organization_id])
    @org_user = @organization.organization_users.new()
    # @org_user.build_associations
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
        logger.debug("#{org.id}sdfsd#{@organization.id}")
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
