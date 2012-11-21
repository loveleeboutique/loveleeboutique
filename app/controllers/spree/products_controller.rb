module Spree
  class ProductsController < BaseController
    before_filter :load_product, :only => :show
    rescue_from ActiveRecord::RecordNotFound, :with => :render_404
    helper 'spree/taxons'

    respond_to :html

    def index
      params[:product_group_name] = params[:product_group_name].gsub("-dot-",".")
      option_type = Spree::Taxon.find_by_name(params[:product_group_name].titleize) ? "color-type" : Spree::OptionValue.where(:name => params[:product_group_name]).first.option_type.name
      #@products = Spree::Variant.joins(:option_values).where("spree_option_values.name = 'indigo'").collect(&:product).uniq

      @product_group = Spree::ProductGroup.find_by_name(params[:product_group_name])
      @values = @product_group.product_scopes.select{|x| x.arguments[0] == option_type}.map {|x| x.arguments[1]}.compact
      #respond_with(@products)
    end

    def show
      return unless @product

      @variants = Variant.active.includes([:option_values, :images]).where(:product_id => @product.id)
      @product_properties = ProductProperty.includes(:property).where(:product_id => @product.id)

      referer = request.env['HTTP_REFERER']
      if referer
        referer_path = URI.parse(request.env['HTTP_REFERER']).path
        if referer_path && referer_path.match(/\/t\/(.*)/)
          @taxon = Taxon.find_by_permalink($1)
        end
      end

      respond_with(@product)
    end

    private
      def accurate_title
        @product ? @product.name : super
      end

      def load_product
        if try_spree_current_user.try(:has_spree_role?, "admin")
          @product = Product.find_by_permalink!(params[:id])
        else
          @product = Product.active.find_by_permalink!(params[:id])
        end
      end
  end
end
