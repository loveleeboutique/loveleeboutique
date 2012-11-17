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
        crumbs << taxon.ancestors.collect { |ancestor| content_tag(:li, link_to(ancestor.name, seo_url(ancestor)) + separator) } unless taxon.ancestors.empty?
        crumbs << content_tag(:li, content_tag(:span, link_to(taxon.name, seo_url(taxon))))
      else
        crumbs << content_tag(:li, content_tag(:span, t(:products)))
      end
      crumb_list = content_tag(:ul, raw(crumbs.flatten.map { |li| li.mb_chars }.join), :class => 'inline')
      content_tag(:nav, crumb_list, :id => 'breadcrumbs')
    end
  end
end