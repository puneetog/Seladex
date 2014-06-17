class Organization::AccountsController < ApplicationController
	before_filter :organization_account

  def new
    @organization = Organization.find(params[:organization_id])
    @account = Account.new
    @brand_count = @organization.brands.count
    @account.build_associations(@organization)
  end

  def edit
    @organization = Organization.find(params[:organization_id])
    @account = Account.find(params[:id])    
    @brand_count = @organization.brands.count
  end

  def update
    @account = Account.find(params[:id])
    if @account.update_attributes(account_params)
      flash[:message] = "Account Successfully updated."
      redirect_to organization_path(@account.organization)
    else
      render 'new'
    end
  end

  def create
    @organization = Organization.find(params[:organization_id])
    @account = @organization.accounts.new(account_params)    
	  if @account.save
	    flash[:message] = "Account Successfully created."
	    redirect_to organization_path(@organization)
	  else        
	    render 'new'
	  end
  end

  def destroy
  end

  def show
    @organization = Organization.find(params[:organization_id])
    @account = Account.find(params[:id])
  end
  
  private
  def account_params
    params.require(:account).permit!
  end

  def organization_account
    @organization = Organization.find(params[:organization_id]) if params[:organization_id].present?
  end
end
