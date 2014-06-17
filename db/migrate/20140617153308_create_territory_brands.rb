class CreateTerritoryBrands < ActiveRecord::Migration
  def change
    create_table :territory_brands do |t|
      t.integer :brand_id
      t.integer :territory_id

      t.timestamps
    end
  end
end
