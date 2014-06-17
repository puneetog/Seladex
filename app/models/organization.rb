class Organization < ActiveRecord::Base

	# validates :email, presence: true, uniqueness: true

    has_many :organization_managements
    has_many :brands
    has_many :accounts
    has_many :addresses, :as => :addressable, dependent: :destroy
	has_many :organization_users, through: :organization_managements
    has_many :roles, dependent: :destroy
    belongs_to :organization_admin


    after_save :check_status
	after_create :confirmation_mail
     
    validates :organization_admin, presence: true
    validates :addresses, presence: true

    accepts_nested_attributes_for :organization_admin, :reject_if => :all_blank
    accepts_nested_attributes_for :addresses, :reject_if => :all_blank, :allow_destroy => true


    accepts_nested_attributes_for :roles, allow_destroy: true, reject_if: :all_blank

    has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

    def build_rol_associations
      1.times { roles.build } if self.roles.empty?
      self
    end

	attr_accessor :user_password

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

    def mailing_address
        addresses.where(address_type: "Mailing")[0]
    end

     def billing_address
        addresses.where(address_type: "Billing")[0]
    end
end
