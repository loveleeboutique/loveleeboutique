module Spree
  module Core
    ControllerHelpers.module_eval do

      def render_404(exception = nil)
        respond_to do |type|
          type.html { render :status => :not_found, :file => "#{::Rails.root}/app/views/spree/exceptions/404", :formats => [:html], :layout => 'spree/layouts/exceptions' }
          type.all { render :status => :not_found, :nothing => true }
        end
      end

    end
  end
end