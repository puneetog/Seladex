class BrandAccount < ActiveRecord::Base
	has_many :statuses
	belongs_to :brand
	belongs_to :account
	
	attr_accessor :enable

	accepts_nested_attributes_for :statuses, allow_destroy: true, reject_if: :all_blank

	def build_associations
		1.times { statuses.build } if self.statuses.empty?
		self
	end


end
