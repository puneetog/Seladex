class CreateAdminVideos < ActiveRecord::Migration
  def change
    create_table :admin_videos do |t|

      t.timestamps
      t.string :video_url
      t.string :name
      t.integer :user_id
    end
  end
end
