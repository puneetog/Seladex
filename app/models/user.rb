class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable#, :confirmable

  # validates :name, presence: true
  DEFAULT_NUM_USERSTOREMANAGEMENTS = 1

  ROLES = [:admin, :store_admin, :user]
  has_many :user_store_managements
  has_many :stores, through: :user_store_managements

  accepts_nested_attributes_for :user_store_managements, allow_destroy: true, reject_if: :all_blank
  
  def build_associations
    DEFAULT_NUM_USERSTOREMANAGEMENTS.times { user_store_managements.build } if self.user_store_managements.empty?
    self
    #build_user_store_managements if self.user_store_managements.blank?
  end
  
  ROLES.each do |role|
    define_method "#{role}?" do
      self.role.try(:downcase).to_sym == role
    end
  end

  def role?(user_role)  	
  	self.role.try(:downcase).to_s == user_role.try(:downcase).to_s
  end  

  def save_store_permisions(param)
    logger.debug(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
    logger.debug(param)
    logger.debug(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
    logger.debug(param["0"]["order"])
    self.user_store_managements.last.order = param["0"]["order"]
    self.user_store_managements.last.invoice = param["0"]["invoice"]
    self.user_store_managements.last.commission = param["0"]["commission"]
    self.user_store_managements.last.user_rep = param["0"]["user_rep"] 
    self.user_store_managements.last.contact = param["0"]["contact"]
  end

end
