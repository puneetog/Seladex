class Organization < ActiveRecord::Base

	# validates :email, presence: true, uniqueness: true

    has_many :organization_managements
    has_many :organization_addresses, dependent: :destroy
	has_many :organization_users, through: :organization_managements
    belongs_to :organization_admin

    after_save :check_status
	after_create :confirmation_mail
     
    validates :organization_admin, presence: true
    validates :organization_addresses, presence: true

    accepts_nested_attributes_for :organization_admin, :reject_if => :all_blank
    accepts_nested_attributes_for :organization_addresses, :reject_if => :all_blank, :allow_destroy => true

	attr_accessor :user_password

    # def organizations_for_user
    #   collection = organization_managements.where(test_set_id: id)
    #   collection.any? ? collection : tags.build
    # end
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
