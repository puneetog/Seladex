class UserStoreManagement < ActiveRecord::Base
	store_accessor :contact, :order, :invoice, :commission, :user_rep

	belongs_to :user
	belongs_to :store
end
