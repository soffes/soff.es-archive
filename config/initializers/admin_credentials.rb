unless Rails.env == "production"
  ADMIN_USERNAME = "admin" unless defined?(ADMIN_USERNAME)
  ADMIN_PASSWORD = "password" unless defined?(ADMIN_PASSWORD)
end
