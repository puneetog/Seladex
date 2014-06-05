class OrganizationManagement < ActiveRecord::Base
	store_accessor :contact, :order, :invoice, :commission, :user_rep

	belongs_to :organization_user
	belongs_to :organization
end
