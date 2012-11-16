module Spree
  class CategoryImage < Asset
    validates_attachment_presence :attachment
    validate :no_attachment_errors

    attr_accessible :alt, :attachment, :position, :viewable_type, :viewable_id,  :link_url, :popup_link, :popup_width, :popup_height

    has_attached_file :attachment,
                      :styles => {
                                    :banner => "942x308",
                                    :thumb => "100x100" },
                      default_style: :large,
                      url: %{/spree/categories/:id/:style/:basename.:extension},
                      path: %{:rails_root/public/spree/categories/:id/:style/:basename.:extension}

    # if there are errors from the plugin, then add a more meaningful message
    def no_attachment_errors
      unless attachment.errors.empty?
        # uncomment this to get rid of the less-than-useful interrim messages
        # errors.clear
        errors.add :attachment, "Paperclip returned errors for file '#{attachment_file_name}' - check ImageMagick installation or image source file."
        false
      end
    end
  end
end
