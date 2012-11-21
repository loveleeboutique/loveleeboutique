class Spree::Admin::Cms::StaticPagesController < Spree::Admin::BaseController
  respond_to :html

  def index
    @static_pages = Spree::StaticPage.order("id ASC").all
  end

  def edit
    @static_page = Spree::StaticPage.find(params[:id])
  end

  def update
    @static_page = Spree::StaticPage.find(params[:id])

    respond_to do |format|
      if @static_page.update_attributes(params[:static_page])
        format.html { redirect_to spree.admin_static_pages_url, notice: 'Image was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end
end