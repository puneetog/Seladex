class Brand < ActiveRecord::Base
	belongs_to :organization

	has_many :organization_user_brands
	has_many :organization_users, through: :organization_user_brands
	has_many :brand_accounts	
	has_many :accounts, through: :brand_accounts
	has_many :brand_statuses, dependent: :destroy
	has_many :territory_brands
	has_many :brands, through: :territory_brands

	has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

    accepts_nested_attributes_for :brand_statuses,:territory_brands, allow_destroy: true, reject_if: :all_blank

	def territory
		if self.territory_brands.present?
			self.territory_brands.map{|tb| tb.territory.name}.join(", ")
		end
	end

	def representative_names
      organization_users.map{|user| user.name}.join(", ")
	end

	def status
  #     	status = self.statuses.sort_by{|s| s.time_frame.to_i}.first
		# return status.present? ? status.state : ''
		return "lead"
	end

	def build_statuses
		 1.times { brand_statuses.build } if self.brand_statuses.blank?
	end

	def build_territories
		 1.times { brand_territories.build } if self.brand_territories.blank?
	end

	def initialized_terretories(organization) 
		territories = Territory.all
		[].tap do |o|
			territories.each do |territory|
				logger.debug(territory)
				if c = territory_brands.find { |c| c.territory_id == territory.id }
				  o << c.tap { |c| c.enable ||= true }
				else
				  o << TerritoryBrand.new(territory: territory)
				end
			end
		end
    end
	

end
