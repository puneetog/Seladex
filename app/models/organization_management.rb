class OrganizationManagement < ActiveRecord::Base
	store_accessor :orders
	store_accessor :invoice
	store_accessor :user_rep
	store_accessor :contact
	store_accessor :commission

	belongs_to :organization_user
	belongs_to :organization
	belongs_to :role

	accepts_nested_attributes_for :role, allow_destroy: true, reject_if: :all_blank

	def build_role_associations
		role.build 		
	end
end

