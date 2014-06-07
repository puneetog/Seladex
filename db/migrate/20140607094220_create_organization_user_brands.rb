class CreateOrganizationUserBrands < ActiveRecord::Migration
  def change
    create_table :organization_user_brands do |t|
      t.integer :brand_id
      t.integer :organization_user_id

      t.timestamps
    end
  end
end
