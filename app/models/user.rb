class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 
  ROLES = [:admin, :user]

  def role?(user_role)  	
  	self.role.to_s == user_role.to_s
  end

end
