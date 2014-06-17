class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :state
      t.string :time_frame
      t.string :description
      t.integer :brand_account_id

      t.timestamps
    end
  end
end
