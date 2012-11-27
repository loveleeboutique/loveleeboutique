module Spree
  AppConfiguration.class_eval do
    preference :products_per_page, :integer, :default => 20
    preference :attachment_styles, :string, :default => "{\"mini\":\"152x152>\",\"small\":\"227x269>\",\"product\":\"910x1374>\",\"large\":\"600x600>\"}"
  end
end
