class OrganizationAdmin < User
  has_many :organizations
  # has_many :organizations, through: :organization_managements

end