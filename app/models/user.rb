class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable#, :confirmable

  # validates :name, presence: true
  ROLES = [:admin, :store_admin, :user]
  has_many :user_store_managements
  has_many :stores, through: :user_store_managements

  ROLES.each do |role|
    # define methods such as user?, admin? etc.
    define_method "#{role}?" do
      self.role.try(:downcase).to_sym == role
    end
  end

  def role?(user_role)  	
  	self.role.try(:downcase).to_s == user_role.try(:downcase).to_s
  end  

end
