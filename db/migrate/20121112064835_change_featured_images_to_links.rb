class ChangeFeaturedImagesToLinks < ActiveRecord::Migration
  def up
    add_column :spree_homepage_images, :image_link, :string
  end

  def down
    remove_column :spree_homepage_images, :image_link
  end
end
