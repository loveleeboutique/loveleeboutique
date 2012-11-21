Loveleeboutique::Application.routes.draw do

  # This line mounts Spree's routes at the root of your application.
  # This means, any requests to URLs such as /products, will go to Spree::ProductsController.
  # If you would like to change where this engine is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Spree relies on it being the default of "spree"
  mount Spree::Core::Engine, :at => '/'

  Spree::Core::Engine.routes.prepend do

    match '/admin/homepage_images', :to => 'admin/cms/homepage_images#index', :as => :admin_homepage_images
    match '/admin/static_pages', :to => 'admin/cms/static_pages#index', :as => :admin_static_pages


    match '/new', :to => 'home#new'

    namespace :admin do
      namespace :cms do
        resources :homepage_images
        resources :static_pages
        resources :metadata_tags
      end


      resources :categories do
        resources :category_image, only: [:index, :create]
        collection do
          post :update_positions
        end
      end

    end

    match '/contact', :to => 'home#contact'

  end
  # See how all your routes lay out with "rake routes"

  Spree::Core::Engine.routes.append do
        #   # route globbing for pretty nested taxon and product paths
    match '/*id', :to => 'taxons#show', :as => :nested_taxons
end
  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
