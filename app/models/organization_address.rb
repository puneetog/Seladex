class OrganizationAddress < ActiveRecord::Base
	belongs_to :organization

	ADDRESS_TYPE = ["Mailing", "Billing"]
end
