module Spree
  module BaseHelper
    def logo
      link_to image_tag('/assets/logo.png'), root_path
    end

    def breadcrumbs(taxon, separator="&nbsp;&raquo;&nbsp;")
      return "" if current_page?("/") || taxon.nil?
      separator = raw(separator)
      crumbs = [content_tag(:li, link_to(t(:home), root_path) + separator)]
      if taxon
        crumbs << taxon.ancestors.collect { |ancestor| content_tag(:li, link_to(ancestor.name, seo_url(ancestor)) + separator, :class => ancestor.name) } unless taxon.ancestors.empty?
        if taxon.name == "Categories"
          crumbs << content_tag(:li, content_tag(:span, link_to("New", new_path)))
        else
          crumbs << content_tag(:li, content_tag(:span, link_to(taxon.name, seo_url(taxon))))
        end

      else
        crumbs << content_tag(:li, content_tag(:span, t(:products)))
      end
      crumb_list = content_tag(:ul, raw(crumbs.flatten.map { |li| li.mb_chars }.join), :class => 'inline')
      content_tag(:nav, crumb_list, :id => 'breadcrumbs')
    end

    def variant_options(v, allow_back_orders = Spree::Config[:allow_backorders], include_style = true)
      list = v.options_text

      # We shouldn't show out of stock if the product is infact in stock
      # or when we're not allowing backorders.
      unless (allow_back_orders || v.in_stock?)
        list = if include_style
                 content_tag(:span, "#{list}", :class => 'out-of-stock')
               else
                 "#{t(:out_of_stock)} #{list}"
               end
      end

      list
    end

    def taxon_preview(taxon, max=4)
         products = taxon.active_products.limit(max)
         if (products.size < max) && Spree::Config[:show_descendents]
           taxon.descendants.each do |taxon|
             to_get = max - products.length
             products += taxon.active_products.limit(to_get)
             products = products.uniq
             break if products.size >= max
           end
         end
         products
       end


  end
end
