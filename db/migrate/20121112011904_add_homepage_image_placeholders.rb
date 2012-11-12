class AddHomepageImagePlaceholders < ActiveRecord::Migration
  def up
    temp = Spree::HomepageImage.new(:position => "slider", :description => "Slider image #1: (942x506)", :permanent => true)
    temp.save(:validate => false)
    temp = Spree::HomepageImage.new(:position => "slider", :description => "Slider image #2: (942x506)", :permanent => true)
    temp.save(:validate => false)
    temp = Spree::HomepageImage.new(:position => "slider", :description => "Slider image #3: (942x506)", :permanent => true)
    temp.save(:validate => false)
    temp = Spree::HomepageImage.new(:position => "slider", :description => "Slider image #4: (942x506)", :permanent => true)
    temp.save(:validate => false)
    temp = Spree::HomepageImage.new(:position => "slider", :description => "Slider image #5: (942x506)", :permanent => true)
    temp.save(:validate => false)
    temp = Spree::HomepageImage.new(:position => "feature", :description => "Feature image #1: (266x310)", :permanent => true)
    temp.save(:validate => false)
    temp = Spree::HomepageImage.new(:position => "feature", :description => "Feature image #2: (266x310)", :permanent => true)
    temp.save(:validate => false)
    temp = Spree::HomepageImage.new(:position => "feature", :description => "Feature image #3: (266x310)", :permanent => true)
    temp.save(:validate => false)
  end

  def down
  end
end
