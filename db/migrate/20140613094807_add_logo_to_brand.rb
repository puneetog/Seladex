class AddLogoToBrand < ActiveRecord::Migration
  def self.up
    add_attachment :brands, :logo
  end

  def self.down
    remove_attachment :brands, :logo
  end
end
