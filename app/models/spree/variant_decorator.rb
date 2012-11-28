module Spree
  Variant.class_eval do
    def options_text
          values = self.option_values.sort_by(&:option_type_id)

          values.map! do |ov|
            "#{ov.presentation}"
          end

          values.to_sentence({ :words_connector => " ", :two_words_connector => " " }).gsub(" ", '<br/>').html_safe
    end
  end
end

