Rails.application.configure do
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local = true

  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.seconds.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end
  
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.perform_caching = false
  config.active_support.deprecation = :log
  config.active_record.migration_error = :page_load
  config.assets.debug = true
  config.assets.quiet = true
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker
  # Paperclip.options[:command_path] = "/usr/local/bin/"
  #
  # # config for amazon S3 and paperclip, method 2 using dotenv direct
  #   config.paperclip_defaults = {
  #     :storage => :s3,
  #     :s3_credentials => {
  #       :bucket => ENV['S3_BUCKET_NAME'],
  #       :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
  #       :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
  #     }
  #   }
end
