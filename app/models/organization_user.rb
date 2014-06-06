class OrganizationUser < User
  has_many :organization_managements
  has_many :organizations, through: :organization_managements

	DEFAULT_NUM_ORGANIZATIONMANAGEMENTS = 1

	accepts_nested_attributes_for :organization_managements, allow_destroy: true, reject_if: :all_blank

	def build_associations
		DEFAULT_NUM_ORGANIZATIONMANAGEMENTS.times { organization_managements.build } if self.organization_managements.empty?
		self
	end

	def self.get_org_user(param)
		return {first_name: param[:first_name], last_name: param[:last_name],
			email: param[:email], password: param[:password], 
			password_confirmation: param[:password_confirmation]}
	end

	def self.get_org_user_per(param)
		return param[:organization_managements_attributes]
	end
end