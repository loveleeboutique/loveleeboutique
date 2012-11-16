Deface::Override.new(:virtual_path => "spree/layouts/admin",
                      :name => 'categories',
                      :insert_bottom => "[data-hook='admin_tabs']",
                      :text => '<li class="<% if params[:controller] =~ /^spree\/admin\/categor*/ %>selected<% end %>"><a href="<%= admin_categories_path %>">Categories</a></li>'
                      )