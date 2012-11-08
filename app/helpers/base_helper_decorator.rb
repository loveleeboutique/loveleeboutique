module Spree
  module BaseHelper
    def logo
      link_to image_tag('/assets/logo.png'), root_path
    end
  end
end