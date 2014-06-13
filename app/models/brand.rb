class Brand < ActiveRecord::Base
	belongs_to :organization

	has_many :organization_user_brands
	has_many :organization_users, through: :organization_user_brands
	has_many :brand_accounts	
	has_many :accounts, through: :brand_accounts

	has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

	def territory
		organization_users.map{|user| user.territory}.join(", ")
	end

	def representative_names
      organization_users.map{|user| user.name}.join(", ")
	end

end
