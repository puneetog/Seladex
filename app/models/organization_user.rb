class OrganizationUser < User
  has_many :organization_managements
  has_many :organizations, through: :organization_managements, dependent: :destroy


  has_many :organization_user_brands
  has_many :brands, through: :organization_user_brands, dependent: :destroy

  DEFAULT_NUM_ORGANIZATIONMANAGEMENTS = 1


	accepts_nested_attributes_for :organization_managements, allow_destroy: true, reject_if: :all_blank
	accepts_nested_attributes_for :organization_user_brands, allow_destroy: true, reject_if: :all_blank

	# def build_associations
	# 	DEFAULT_NUM_ORGANIZATIONMANAGEMENTS.times { organization_managements.build } if self.organization_managements.empty?
	# 	# organization_managements.role.build
	# 	# self
	# end

	def role_name
		organization_managements.last.role.try(:name)
	end

	def self.get_org_user(param)
		return {first_name: param[:first_name], last_name: param[:last_name],
			email: param[:email], password: param[:password], 
			password_confirmation: param[:password_confirmation]}
	end

	def self.get_org_user_per(param)
		return param[:organization_managements_attributes]
	end

	def initialized_brands 
	    [].tap do |o|
	      Brand.all.each do |brand|
	        if c = organization_user_brands.find { |c| c.brand_id == brand.id }
	          o << c.tap { |c| c.enable ||= true }
	        else
	          o << OrganizationUserBrand.new(brand: brand)
	        end
	      end
	    end
    end
end