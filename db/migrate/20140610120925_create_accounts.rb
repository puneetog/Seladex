class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :general_note
      t.string :organization_id
      t.timestamps
    end
  end
end
