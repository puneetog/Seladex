class AddFieldsToBrand < ActiveRecord::Migration
  def change
    add_column :brands, :manufacturer, :string
    add_column :brands, :contact, :string
    add_column :brands, :address, :string
    add_column :brands, :city, :string
    add_column :brands, :state, :string
    add_column :brands, :zip, :string
    add_column :brands, :country, :string
    add_column :brands, :phone, :string
    add_column :brands, :fax, :string
    add_column :brands, :email, :string
    add_column :brands, :website, :string
  end
end
