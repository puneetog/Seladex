class CreateTerritories < ActiveRecord::Migration
  def change
    create_table :territories do |t|
      t.string :name
      t.string :abbreviation
      t.string :country
      t.string :type
      t.string :sort
      t.string :status
      t.string :occupied
      t.string :notes
      t.string :fips_state
      t.string :assoc_press

      t.integer :account_id

      t.timestamps
    end
  end
end
