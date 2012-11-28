class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_static_page_data
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404


  def set_static_page_data
    @policy = Spree::StaticPage.where(:name => "Policy").first
  end

end

