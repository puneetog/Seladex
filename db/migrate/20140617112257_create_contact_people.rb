class CreateContactPeople < ActiveRecord::Migration
  def change
    create_table :contact_people do |t|
      t.string :first_name
      t.string :last_name
      t.string :title
      t.integer :account_id
      t.timestamps
    end
  end
end
