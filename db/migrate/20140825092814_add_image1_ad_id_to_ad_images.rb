class AddImage1AdIdToAdImages < ActiveRecord::Migration
  def change
    add_column :ad_images, :image1, :string
    add_column :ad_images, :ad_id, :integer
  end
end
