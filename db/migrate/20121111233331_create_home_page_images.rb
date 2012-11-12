class CreateHomePageImages < ActiveRecord::Migration
  def change
    create_table :spree_homepage_images do |t|

    	t.string :position
    	t.string :description
    	t.boolean :permanent
    	t.string :category
      t.string :item_label
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at

      t.timestamps
    end
  end
end
