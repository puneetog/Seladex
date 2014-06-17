class Account < ActiveRecord::Base
	has_many :contact_informations
  has_many :contact_people
	belongs_to :organization
	has_many :brand_accounts
	has_many :brands, through: :brand_accounts
  has_many :addresses, :as => :addressable, dependent: :destroy

  validates :name, presence: true


  accepts_nested_attributes_for :brand_accounts,:contact_people, allow_destroy: true, reject_if: :all_blank

  accepts_nested_attributes_for :contact_informations, allow_destroy: true, :reject_if => proc {|attrs| attrs['phone'].blank? }

  accepts_nested_attributes_for :addresses, allow_destroy: true, :reject_if => proc {|attrs| attrs['city'].blank? }

  validate :phone_or_city  

   def build_associations(organization)
      1.times { contact_people.build } if self.contact_people.empty?
      1.times { contact_informations.build } if self.contact_informations.empty?
      3.times { addresses.build } if self.addresses.empty?
      self
    end

    def initialized_brands(organization) 
      organization_brands = organization.brands
      # binding.pry
      [].tap do |o|
        organization_brands.each do |brand|
          if c = brand_accounts.find { |c| c.brand_id == brand.id }
            o << c.tap { |c| c.enable ||= true }
          else
            o << BrandAccount.new(brand: brand)
          end
        end
      end
    end

    def phone_or_city
      if contact_informations.empty?
        if addresses.empty?
          errors.add(:contact_informations, 'must have phone')
        end
      elsif addresses.empty?
        if contact_informations.empty?
          errors.add(:addresses, 'must have city')
        end
      end
        
    end
    
end
