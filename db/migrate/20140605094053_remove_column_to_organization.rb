class RemoveColumnToOrganization < ActiveRecord::Migration
  def change
    remove_column :organizations, :mailing_address, :string
    remove_column :organizations, :billing_address, :string
    remove_column :organizations, :city, :string
    remove_column :organizations, :state, :string
    remove_column :organizations, :zip, :string
    remove_column :organizations, :country, :string
    remove_column :organizations, :phone, :string
    remove_column :organizations, :fax, :string
  end
end
