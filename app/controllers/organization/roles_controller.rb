class Organization::RolesController < ApplicationController
  def new
    @organization = Organization.find(params[:organization_id])
    @role = @organization.roles.new
  end

  def edit
    @organization = OrganizationUser.find(params[:organization_id])    
    @role = Role.find(params[:id])
  end

  def update
    @role = Role.find(params[:id])
    if @role.update_attributes(role_params)
      flash[:message] = "Role Successfully updated."
      redirect_to organization_path(@role.organization)
    else
      render 'new'
    end
  end

  def create
    @organization = Organization.find(params[:organization_id])
    @role = @organization.roles.new(role_params)
    @role.organization = @organization  
    if @role.save
        flash[:message] = "Role Successfully created."
        redirect_to organization_path(@organization)
    else      
      render 'new'
    end
  end

  def destroy
  end
  
  private
  def role_params
    params.require(:role).permit!
    # params.require(:organization_user).permit(:first_name, :email, :password, :password_confirmation, :last_name, organization_managements_attributes: [:contact, :orders, :invoice, :commission, :user_rep])
  end
end
