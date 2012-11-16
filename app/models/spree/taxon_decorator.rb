module Spree
  Taxon.class_eval do



    attr_accessible :image_attributes

    has_one :image, :as => :viewable, :dependent => :destroy, class_name: 'Spree::CategoryImage'

    accepts_nested_attributes_for :image




  end

end
