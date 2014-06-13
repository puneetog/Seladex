class Account < ActiveRecord::Base
	has_many :contact_informations
	belongs_to :organization
	has_many :brand_accounts
	has_many :brands, through: :brand_accounts
  has_many :addresses, :as => :addressable, dependent: :destroy

	accepts_nested_attributes_for :contact_informations,:brand_accounts,:addresses, allow_destroy: true, reject_if: :all_blank

   def build_associations(organization)
      count = organization.brands.count
      1.times { contact_informations.build } if self.contact_informations.empty?
      3.times { addresses.build } if self.addresses.empty?
      count.times { brand_accounts.build } if self.brand_accounts.empty?
      brand_accounts.each(&:build_associations)
      self
    end
    
end
