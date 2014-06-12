class Brand < ActiveRecord::Base
	belongs_to :organization

	has_many :organization_user_brands
	has_many :organization_users, through: :organization_user_brands
	has_many :brand_accounts	
	has_many :accounts, through: :brand_accounts

	

end
