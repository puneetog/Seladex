class UserStoreManagement < ActiveRecord::Base
	store_accessor :orders
	store_accessor :invoice
	store_accessor :user_rep
	store_accessor :contact
	store_accessor :commission

	belongs_to :user
	belongs_to :store
end
