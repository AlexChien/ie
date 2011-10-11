Ie::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # The production environment is meant for finished, "live" apps.
  # Code is not reloaded between requests
  config.cache_classes = true

  # Full error reports are disabled and caching is turned on
  config.consider_all_requests_local       = false
  
  config.action_controller.perform_caching = true
  config.cache_store = :file_store, "tmp/cache"
  
  # rails3.1.0 production下使用Rack::Cache就报错
  # http://jackchu.com/rails-31-asset-pipeline-content-delivery-netw
  # require 'rack/cache'
  # config.middleware.delete Rack::Cache
  
  # rails3.1.1
  # Update to rack-cache 1.1.
  # Versions prior to 1.1 delete the If-Modified-Since and If-Not-Modified headers when config.actioncontroller.performcaching is true. This has two problems:
  #     * unexpected inconsistent behaviour between development & production environments
  #     * breaks applications that use of these headers

  # Specifies the header that your server uses for sending files
  # config.action_dispatch.x_sendfile_header = "X-Sendfile"

  # For nginx:
  config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect'

  # If you have no front-end server that supports something like X-Sendfile,
  # just comment this out and Rails will serve the files

  # See everything in the log (default is :info)
  # config.log_level = :debug

  # Use a different logger for distributed setups
  # config.logger = SyslogLogger.new

  # Use a different cache store in production
  # config.cache_store = :mem_cache_store

  # Disable Rails's static asset server
  # In production, Apache or nginx will already do this
  # config.serve_static_assets = false

  # Enable serving of images, stylesheets, and javascripts from an asset server
  # config.action_controller.asset_host = "http://assets.example.com"

  # Disable delivery errors, bad email addresses will be ignored
  # config.action_mailer.raise_delivery_errors = false

  # Enable threaded mode
  # config.threadsafe!

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation can not be found)
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners
  config.active_support.deprecation = :notify
  
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.default_url_options = { :host => "www.idealenergy.com" }
  config.action_mailer.smtp_settings = {
    :address => "mail.enjoyoung.cn",
    :port => 25,
    :domain => "mail.enjoyoung.cn",
    :authentication => :login,
    :user_name => "enjoyoung_mailer@enjoyoung.cn",
    :password => "1q!2w@3e#",
    :default_charset => "utf-8",
    :default_content_type => "text/html; charset=utf-8"
  }

  config.action_mailer.perform_deliveries = true
  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default :charset => "utf-8"
  
  # Compress JavaScripts and CSS
  config.assets.compress = true

  # Choose the compressors to use
  # config.assets.js_compressor  = :uglifier
  # config.assets.css_compressor = :yui

  # Don't fallback to assets pipeline if a precompiled asset is missed
  config.assets.compile = true

  # Generate digests for assets URLs.
  config.assets.digest = true

  # Defaults to Rails.root.join("public/assets")
  # config.assets.manifest = YOUR_PATH

  # Precompile additional assets (application.js, application.css, and all non-JS/CSS are already added)
  # config.assets.precompile += %w( search.js )
end
