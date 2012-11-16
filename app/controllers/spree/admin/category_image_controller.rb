module Spree
  module Admin
    class CategoryImageController < BaseController
      before_filter :load_category
      respond_to :html

      def index
        @image = @category.image || @category.build_image
      end

      def create
        @image = @category.image || @category.build_image

        @image.update_attributes(params[:category_image]) do |image|
          image.viewable = @category
        end

        if @image.errors.empty?
          redirect_to spree.admin_category_category_image_index_path(@category)
        else
          render :index
        end
      end

    protected

      def load_category
        @category = Spree::Taxon.find_by_id(params[:category_id])
      end
    end
  end
end
