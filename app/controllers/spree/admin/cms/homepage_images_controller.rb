class Spree::Admin::Cms::HomepageImagesController < Spree::Admin::BaseController

  respond_to :html

  def index
    @homepage_images = Spree::HomepageImage.order("id ASC").all
  end

  def edit
    @homepage_image = Spree::HomepageImage.find(params[:id])
  end

  def update
    @homepage_image = Spree::HomepageImage.find(params[:id])

    respond_to do |format|
      if @homepage_image.update_attributes(params[:homepage_image])
        format.html { redirect_to spree.admin_homepage_images_url, notice: 'Image was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @homepage_image = Spree::HomepageImage.find(params[:id])
    @homepage_image.image = nil
    respond_to do |format|
      if @homepage_image.save
        format.html { redirect_to spree.admin_homepage_images_url, notice: 'Image was successfully deleted.' }
      end
    end
  end

end
