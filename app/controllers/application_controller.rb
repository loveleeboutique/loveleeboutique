class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_static_page_data


  def set_static_page_data
    @policy = Spree::StaticPage.where(:name => "Policy").first
  end

end
