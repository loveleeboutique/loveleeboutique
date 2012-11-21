Spree::HomeController.class_eval do

  def index


    @slider_images = Spree::HomepageImage.where(:position => "slider", :visible => true).order("id ASC").all.delete_if {|element| !element.image? }
    @feature_images = Spree::HomepageImage.where(:position => "feature").order("id ASC").all.delete_if {|element| !element.image? }
  end


  def new
    @taxon = Spree::Taxonomy.where(:name => "Categories").first.root
    @products = Spree::Product.where("available_on < ?", 2.weeks.ago)
    @new_image = Spree::HomepageImage.where(:position => "new").first.image

  end

end
