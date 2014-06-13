class CreateContactInformations < ActiveRecord::Migration
  def change
    create_table :contact_informations do |t|

      t.integer :phone
      t.integer :fax
      t.string :email
      t.string :website
      t.string :location
      t.integer :account_id
      t.timestamps
    end
  end
end