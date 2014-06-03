class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # validates :name, presence: true
  ROLES = [:admin, :user]

  belongs_to :store

  def role?(user_role)  	
  	self.role.try(:downcase).to_s == user_role.try(:downcase).to_s
  end

end
