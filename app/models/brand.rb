class Brand < ActiveRecord::Base
	belongs_to :organization

	has_many :organization_user_brands
	has_many :organization_users, through: :organization_user_brands
	has_many :brand_accounts	
	has_many :accounts, through: :brand_accounts
	has_many :brand_statuses, dependent: :destroy

	has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

   accepts_nested_attributes_for :brand_statuses, allow_destroy: true, reject_if: :all_blank

	def territory
		organization_users.map{|user| user.territory}.join(", ")
	end

	def representative_names
      organization_users.map{|user| user.name}.join(", ")
	end

	def representative_names
      	status = self.statuses.sort_by{|s| s.time_frame.to_i}.first
		return status.present? ? status.state : ''
	end

	def build_statuses
		 1.times { brand_statuses.build } if self.brand_statuses.blank?
	end

end
