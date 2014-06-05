class OrganizationAdmin < User
  has_many :organization_managements
  has_many :organizations, through: :organization_managements

end