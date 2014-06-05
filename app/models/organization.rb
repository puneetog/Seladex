class Organization < ActiveRecord::Base

	validates :email, presence: true, uniqueness: true

    has_many :organization_managements
	has_many :organization_admins, through: :organization_managements
    after_save :check_status
	after_create :confirmation_mail

	attr_accessor :user_password

    DEFAULT_NUM_ORGANIZATIONMANAGEMENTS = 1

    accepts_nested_attributes_for :organization_managements, allow_destroy: true, reject_if: :all_blank
  
    def build_associations
        DEFAULT_NUM_ORGANIZATIONMANAGEMENTS.times { organization_managements.build } if self.organization_managements.empty?
        self
    end

	def confirmation_mail
        Notification.send_confirmation_mail(self).deliver
        Notification.send_organization_confirmation(self).deliver
	end

	def organization_status
		status ? "Active" : "Deactive"
	end
     
    def check_status    	
    	if status_changed? and status    		
           Notification.send_activation_mail(self).deliver
    	end
    end

    def name
      "#{first_name} #{last_name}"
    end
end
