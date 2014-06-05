class OrganizationManagement < ActiveRecord::Base
	store_accessor :contact, :order, :invoice, :commission, :user_rep

	belongs_to :organization_admin
	belongs_to :organization
end
