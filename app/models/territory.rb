class Territory < ActiveRecord::Base
	has_many :brand_territories
	has_many :brands, through: :brand_territories
	
end
