class CreateBrandStatuses < ActiveRecord::Migration
  def change
    create_table :brand_statuses do |t|
      t.string :state
      t.string :condition
      t.integer :duration
      t.string :rule
      t.integer :brand_id

      t.timestamps
    end
  end
end
