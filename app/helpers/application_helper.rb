module ApplicationHelper

	def current_organization_admin
		OrganizationUser.find(current_user.id)
	end

	
end
