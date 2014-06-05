class CreateOrganizationAddresses < ActiveRecord::Migration
  def change
    create_table :organization_addresses do |t|
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.string :phone
      t.string :fax
      t.string :type
      t.integer :organization_id

      t.timestamps
    end
  end
end
