class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  before_filter do
    resource = controller_path.singularize.gsub('/', '_').to_sym 
    method = "#{resource}_params"  
    params[resource] &&= send(method) if respond_to?(method, true)
  end

	rescue_from CanCan::AccessDenied do |exception|
	  flash[:error] = "Access denied."
	  redirect_to root_url
	end

  def get_random_string
    opt = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
      string = (0...8).map { opt[rand(opt.length)] }.join
  end
end
