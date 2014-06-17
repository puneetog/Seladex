class ChangePhoneFaxInContactInformation < ActiveRecord::Migration
  def change
  	change_column :contact_informations, :phone, :string
	change_column :contact_informations, :fax, :string
  end
end
