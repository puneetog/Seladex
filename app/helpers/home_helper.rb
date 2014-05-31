module HomeHelper
	def get_video_url
		Admin::Video.first.try(:video_url)
	end
end
