module Spree
  Image.class_eval do
    has_attached_file :attachment,
                      :styles => {:mini => '152x152>', :small => '227x269>', :product => '910x1374>', :large => '600x600>'},
                      :default_style => :product,
                      :url => '/spree/products/:id/:style/:basename.:extension',
                      :path => 'products/:id/:style/:basename.:extension'
  end

  if Spree::Config[:use_s3]
    s3_creds = {:access_key_id => Spree::Config[:s3_access_key], :secret_access_key => Spree::Config[:s3_secret], :bucket => Spree::Config[:s3_bucket]}
    Spree::HomepageImage.attachment_definitions[:image][:storage] = :s3
    Spree::HomepageImage.attachment_definitions[:image][:s3_credentials] = s3_creds
    Spree::HomepageImage.attachment_definitions[:image][:s3_headers] = ActiveSupport::JSON.decode(Spree::Config[:s3_headers])
    Spree::HomepageImage.attachment_definitions[:image][:bucket] = Spree::Config[:s3_bucket]
  end
end

