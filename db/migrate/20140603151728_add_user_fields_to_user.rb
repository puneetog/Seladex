class AddUserFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :last_name, :string
    add_column :users, :initial, :string
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip, :integer
    add_column :users, :country, :string
    add_column :users, :cell_phone, :integer
    add_column :users, :home_phone, :integer
  end
end
