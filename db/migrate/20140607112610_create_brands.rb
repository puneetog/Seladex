class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|

      t.string :name
      t.string :description   
      t.float :commission_rate   
      t.string :territory   
      t.integer :organization_id

      t.timestamps
    end
  end
end
