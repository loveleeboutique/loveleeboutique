class CreateNewImagePlaceholder < ActiveRecord::Migration
  def up
    temp = Spree::HomepageImage.new(:position => "new", :description => "Feature Image on New Category Page (933x305)", :permanent => true)
    temp.save(:validate => false)
  end

  def down
  end
end
