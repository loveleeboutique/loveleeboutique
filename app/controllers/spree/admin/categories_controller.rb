require 'spree/core/action_callbacks'

class Spree::Admin::CategoriesController < Spree::Admin::BaseController
  helper_method :new_object_url, :edit_object_url, :object_url, :collection_url
  prepend_before_filter :load_resource
  rescue_from ActiveRecord::RecordNotFound, :with => :resource_not_found

  respond_to :html, :json
  respond_to :js, :except => [:show, :index]



  def index
    @collection = Spree::Taxon.find_by_name("Categories").descendants
    respond_with(@collection) do |format|
      format.html
      format.json { render :json => json_data }
    end
  end


  def update_positions
    params[:positions].each do |id, index|
      Spree::Taxon.ordered_roots.where(:id => id).update_all(:position => index)
    end

    respond_to do |format|
      format.js  { render :text => 'Ok' }
    end
  end


  def show
    redirect_to( :action => :edit )
  end

  def edit
    if @object.image.nil?
      @object.build_image
    end
    respond_with(@object) do |format|
      format.html { render :layout => !request.xhr? }
      format.js { render :layout => false }
    end
  end

  def update
    invoke_callbacks(:update, :before)


      if @object.update_attributes(params[:taxon])
        invoke_callbacks(:update, :after)
        flash.notice = flash_message_for(@object, :successfully_updated)
        respond_with(@object) do |format|
          format.html { redirect_to location_after_save }
          format.js   { render :layout => false }
        end

      else
        invoke_callbacks(:update, :fails)
        respond_with(@object)
      end

  end

  protected

  def resource_not_found
    flash[:error] = flash_message_for(model_class.new, :not_found)
    redirect_to collection_url
  end

  class << self
    attr_accessor :parent_data
    attr_accessor :callbacks

    def belongs_to(model_name, options = {})
      @parent_data ||= {}
      @parent_data[:model_name] = model_name
      @parent_data[:model_class] = model_name.to_s.classify.constantize
      @parent_data[:find_by] = options[:find_by] || :id
    end

    def new_action
      @callbacks ||= {}
      @callbacks[:new_action] ||= Spree::ActionCallbacks.new
    end

    def create
      @callbacks ||= {}
      @callbacks[:create] ||= Spree::ActionCallbacks.new
    end

    def update
      @callbacks ||= {}
      @callbacks[:update] ||= Spree::ActionCallbacks.new
    end

    def destroy
      @callbacks ||= {}
      @callbacks[:destroy] ||= Spree::ActionCallbacks.new
    end
  end

  def model_class
    "Spree::Taxon".constantize
  end

  def model_name
    parent_data[:model_name].gsub('spree/', '')
  end

  def object_name
    controller_name.singularize
  end

  def load_resource
    if member_action?
      @object ||= load_resource_instance
      instance_variable_set("@#{object_name}", @object)
    else
      @collection ||= collection
      instance_variable_set("@#{controller_name}", @collection)
    end
  end

  def load_resource_instance
    if new_actions.include?(params[:action].to_sym)
      build_resource
    elsif params[:id]
      find_resource
    end
  end

  def parent_data
    self.class.parent_data
  end

  def parent
    if parent_data.present?
      @parent ||= parent_data[:model_class].where(parent_data[:find_by] => params["#{model_name}_id"]).first
      instance_variable_set("@#{model_name}", @parent)
    else
      nil
    end
  end

  def find_resource
    if parent_data.present?
      parent.send(controller_name).find(params[:id])
    else
      model_class.find(params[:id])
    end
  end

  def build_resource
    if parent_data.present?
      parent.send(controller_name).build(params[object_name])
    else
      model_class.new(params[object_name])
    end
  end

  def collection
    return @collection if @collection.present?

    unless request.xhr?
      params[:q] ||= {}

      @search = Spree::Taxon.roots.ransack(params[:q])
      @collection = @search.result.
        page(params[:page]).
        per(Spree::Config[:admin_products_per_page])
    else
      includes = [:avatars]

      @collection = Spree::Taxon.where(["name #{LIKE} ?", "%#{params[:q]}%"])
      @collection = @collection.includes(includes).limit(params[:limit] || 10)

    end
    @collection
  end

  def location_after_save
    collection_url
  end

  def invoke_callbacks(action, callback_type)
    callbacks = self.class.callbacks || {}
    return if callbacks[action].nil?
    case callback_type.to_sym
      when :before then callbacks[action].before_methods.each {|method| send method }
      when :after  then callbacks[action].after_methods.each  {|method| send method }
      when :fails  then callbacks[action].fails_methods.each  {|method| send method }
    end
  end

  # URL helpers

  def new_object_url(options = {})
    if parent_data.present?
      spree.new_polymorphic_url([:admin, parent, model_class], options)
    else
      spree.new_polymorphic_url([:admin, model_class], options)
    end
  end

  def edit_object_url(object, options = {})
    if parent_data.present?
      spree.send "edit_admin_#{model_name}_#{object_name}_url", parent, object, options
    else
      spree.send "edit_admin_#{object_name}_url", object, options
    end
  end

  def object_url(object = nil, options = {})
    target = object ? object : @object
    if parent_data.present?
      spree.send "admin_#{model_name}_#{object_name}_url", parent, target, options
    else
      spree.send "admin_#{object_name}_url", target, options
    end
  end

  def collection_url(options = {})
    if parent_data.present?
      spree.polymorphic_url([:admin, parent, :category], options)
    else
      spree.polymorphic_url([:admin, :category], options)
    end
  end

  def collection_actions
    [:index]
  end

  def member_action?
    !collection_actions.include? params[:action].to_sym
  end

  def new_actions
    [:new, :create]
  end
end
