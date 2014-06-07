class OrganizationUserBrand < ActiveRecord::Base
	belongs_to :brand
	belongs_to :organization_user

	# accepts_nested_attributes_for :brand
end
