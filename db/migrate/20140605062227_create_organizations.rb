class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :website
      t.boolean :status, default: false
      t.text :mailing_address
      t.text :billing_address
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.string :phone
      t.string :fax

      t.timestamps
    end
  end
end
