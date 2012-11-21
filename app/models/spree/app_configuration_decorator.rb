module Spree
  AppConfiguration.class_eval do
    preference :products_per_page, :integer, :default => 20
  end
end
