module Spree
  class CategoryImage < Asset
    validates_attachment_presence :attachment
    validate :no_attachment_errors

    attr_accessible :alt, :attachment, :position, :viewable_type, :viewable_id

    has_attached_file :attachment,
                      :styles => {
                          :banner => "942x308",
                          :thumb => "100x100"},
                      default_style: :large,
                      url: %{categories/:id/:style/:basename.:extension},
                      path: %{categories/:id/:style/:basename.:extension}

    include Spree::Core::S3Support
    supports_s3 :attachment

    if Spree::Config[:use_s3]
      s3_creds = {:access_key_id => Spree::Config[:s3_access_key], :secret_access_key => Spree::Config[:s3_secret], :bucket => Spree::Config[:s3_bucket]}
      Spree::Image.attachment_definitions[:attachment][:storage] = :s3
      Spree::Image.attachment_definitions[:attachment][:s3_credentials] = s3_creds
      Spree::Image.attachment_definitions[:attachment][:s3_headers] = ActiveSupport::JSON.decode(Spree::Config[:s3_headers])
      Spree::Image.attachment_definitions[:attachment][:bucket] = Spree::Config[:s3_bucket]
    end

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
