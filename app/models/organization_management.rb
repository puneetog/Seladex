class OrganizationManagement < ActiveRecord::Base
	store_accessor :orders
	store_accessor :invoice
	store_accessor :user_rep
	store_accessor :contact
	store_accessor :commission

	belongs_to :organization_user
	belongs_to :organization
end

