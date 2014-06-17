class TerritoryBrand < ActiveRecord::Base
	belongs_to :brand
	belongs_to :territory

	attr_accessor :enable	
end
