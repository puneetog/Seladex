class Store < ActiveRecord::Base
	validates :name, presence: true
	validates :email, presence: true

	after_save :confirmation_mail

	def confirmation_mail
        Notification.send_confirmation_mail(self)
        Notification.send_store_confirmation(self)
	end

	def store_status
		status ? "Active" : "Deactive"
	end
end
