class Store < ActiveRecord::Base
	validates :name, presence: true
	validates :email, presence: true, uniqueness: true

    has_many :user_store_managements
	has_many :users, through: :user_store_managements
    after_save :check_status
	after_create :confirmation_mail

	attr_accessor :user_password

	def confirmation_mail
        Notification.send_confirmation_mail(self).deliver
        Notification.send_store_confirmation(self).deliver
	end

	def store_status
		status ? "Active" : "Deactive"
	end
     
    def check_status    	
    	if status_changed? and status    		
           Notification.send_activation_mail(self).deliver
    	end
    end


end
