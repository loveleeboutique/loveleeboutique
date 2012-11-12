Spree::HomeController.class_eval do

  def index


    @slider_images = Spree::HomepageImage.where(:position => "slider", :visible => true).order("id ASC").all.delete_if {|element| !element.image? }
    @feature_images = Spree::HomepageImage.where(:position => "feature").order("id ASC").all.delete_if {|element| !element.image? }
  end

end
