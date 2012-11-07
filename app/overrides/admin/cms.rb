Deface::Override.new(:virtual_path => "spree/layouts/admin",
                      :name => 'cms',
                      :insert_bottom => "[data-hook='admin_tabs']",
                      :text => '<li class="<% if params[:controller] =~ /^spree\/admin\/cms\/*/ %>selected<% end %>"><a href="<%= spree.admin_homepage_images_path %>">CMS</a></li>'
                      )
