class CreateBrandAccounts < ActiveRecord::Migration
  def change
    create_table :brand_accounts do |t|
      t.integer :brand_id
      t.integer :account_id

      t.timestamps
    end
  end
end
