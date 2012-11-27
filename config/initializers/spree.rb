# Configure Spree Preferences
# 
# Note: Initializing preferences available within the Admin will overwrite any changes that were made through the user interface when you restart.
#       If you would like users to be able to update a setting with the Admin it should NOT be set here.
#
# In order to initialize a setting do: 
# config.setting_name = 'new value'
Spree.config do |config|
  # Example:
  # Uncomment to override the default site name.
  # config.site_name = "Spree Demo Site"
  config.use_s3 = true
  config.s3_bucket =
      if Rails.env.production?
        "lovelee"
      else
        "lovelee_dev"
      end
  config.s3_access_key = "AKIAIU243COXPWUKHLIA"
  config.s3_secret = "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"
end

Spree.user_class = "Spree::User"
