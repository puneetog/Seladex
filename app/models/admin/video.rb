class Admin::Video < ActiveRecord::Base
	# permit_params :name, :video_url
	validates :name, presence: true
	validates :video_url, presence: true
	validates :user_id, presence: true
end
