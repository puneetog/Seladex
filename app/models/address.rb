class Address < ActiveRecord::Base
	belongs_to :addressable, :polymorphic => true

	ADDRESS_TYPE = ["Mailing", "Billing", "Shipping"]
	
end
