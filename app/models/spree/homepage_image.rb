class Spree::HomepageImage < ActiveRecord::Base

  attr_accessible :position, :description, :permanent, :image, :category, :item_label, :visible, :image_link

  has_attached_file :image,
                    styles: lambda { |attachment| attachment.instance.image_styles },
                    url: %{/spree/homepage_images/:id/:style/:basename.:extension},
                    path: %{:rails_root/public/spree/homepage_images/:id/:style/:basename.:extension}


  def image_styles
    case position
      when "slider"
        return {:thumb => "472x253>", :default => "942x506>"}
      when "feature"
        return {:thumb => "133x155>", :default => "266x310>"}
      when "new"
        return {:thumb => "467x153>", :default => "933x305>"}
      else
        return {}
    end
  end

  # if there are errors from the plugin, then add a more meaningful message
  def no_attachment_errors
    unless attachment.errors.empty?
      # uncomment this to get rid of the less-than-useful interrim messages
      # errors.clear
      errors.add :image, "Paperclip returned errors for file '#{image_file_name}' - check ImageMagick installation or image source file."
      false
    end
  end
end



