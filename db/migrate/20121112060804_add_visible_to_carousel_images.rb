class AddVisibleToCarouselImages < ActiveRecord::Migration
  def change
    add_column :spree_homepage_images, :visible, :boolean
  end

end
