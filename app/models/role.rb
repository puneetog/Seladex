class Role < ActiveRecord::Base

    has_many :organization_managements
	belongs_to :user
	belongs_to :organization
    
    validates_uniqueness_of  :name 

end
