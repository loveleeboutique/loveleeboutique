module Spree
  Image.class_eval do
    has_attached_file :attachment,
                      :styles => {:mini => '152x152>', :small => '227x269>', :product => '910x1374>', :large => '600x600>'},
                      :default_style => :product,
                      :url => '/spree/products/:id/:style/:basename.:extension',
                      :path => 'products/:id/:style/:basename.:extension'
  end

end

