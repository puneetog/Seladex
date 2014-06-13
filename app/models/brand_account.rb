class BrandAccount < ActiveRecord::Base
	has_many :statuses
	belongs_to :brand
	belongs_to :account

	accepts_nested_attributes_for :statuses, allow_destroy: true, reject_if: :all_blank

	def build_associations
		1.times { statuses.build } if self.statuses.empty?
		self
	end

	def status
		status = self.statuses.sort_by{|s| s.time_frame.to_i}.first
		return status.present? ? status.state : ''
	end
end