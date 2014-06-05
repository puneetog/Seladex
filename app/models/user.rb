class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable#, :confirmable

  # validates :name, presence: true
  ROLES = [:admin, :organization_admin, :organization_user]

  DEFAULT_NUM_OrganizationMANAGEMENTS = 1

  has_many :organization_managements
  has_many :stores, through: :organization_managements

  accepts_nested_attributes_for :organization_managements, allow_destroy: true, reject_if: :all_blank
  
  def build_associations
    DEFAULT_NUM_OrganizationMANAGEMENTS.times { organization_managements.build } if self.organization_managements.empty?
    self
  end

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
