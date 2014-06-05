class Admin::VideosController < ApplicationController
  
	load_and_authorize_resource

	def index
      @videos = Admin::Video.all
	end

	def create
	  @admin_video = Admin::Video.last
	  video_status = if @admin_video.present?
	    @admin_video.update(admin_video_params)
	    
	  else
	   @admin_video = Admin::Video.new(admin_video_params)
	   @admin_video.save		 
	  end		
	  if video_status
	  	flash[:message] = "Video Successfully saved."
	    redirect_to new_admin_video_path
	  else
	    render 'new'
	  end
	end


	def new
	  @video = if Admin::Video.last.present?
			  	Admin::Video.last
			  else
			  	Admin::Video.new
			  end
	end
	
 
private
  def admin_video_params
  	# binding.pry
  	 params[:admin_video][:user_id] = current_user.id
    params.require(:admin_video).permit(:name, :video_url, :user_id)
  end
  
end
