class CreateUserStoreManagements < ActiveRecord::Migration
  def change
    create_table :user_store_managements do |t|
        
      t.timestamps
    end
  end
end
