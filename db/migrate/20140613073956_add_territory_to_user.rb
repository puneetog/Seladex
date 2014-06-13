class AddTerritoryToUser < ActiveRecord::Migration
  def change
    add_column :users, :territory, :string
  end
end
