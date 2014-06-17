class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable#, :confirmable

  # validates :name, presence: true

  has_many :roles, dependent: :destroy

  ROLES = [:admin, :organization_admin, :organization_user]
  
  
  ROLES.each do |role|
    define_method "#{role}?" do
      self.role.try(:downcase).to_sym == role
    end
  end

  def role?(user_role)  	
  	self.role.try(:downcase).to_s == user_role.try(:downcase).to_s
  end  

  def name
    "#{first_name} #{last_name}"
  end

   
end
