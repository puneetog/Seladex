class AddColumnToStore < ActiveRecord::Migration
  def change
    add_column :stores, :manufacturer, :string
    add_column :stores, :contact, :string
    add_column :stores, :address, :text
    add_column :stores, :city, :string
    add_column :stores, :state, :string
    add_column :stores, :zip, :string
    add_column :stores, :country, :string
    add_column :stores, :phone, :string
    add_column :stores, :fax, :string
    add_column :stores, :website, :string
    add_column :stores, :status, :boolean, default: false
  end
end
