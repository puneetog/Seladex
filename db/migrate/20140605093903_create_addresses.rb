class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.string :phone
      t.string :fax
      t.string :address_type
      t.integer :addressable_id
      t.string :addressable_type

      t.timestamps
    end
  end
end
