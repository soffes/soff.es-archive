MAILER_CONFIG = YAML.load_file("#{RAILS_ROOT}/config/config.yml")["mailer"]

ActionMailer::Base.delivery_method = :smtp 
ActionMailer::Base.smtp_settings = {
 :enable_starttls_auto => true,
 :address => "smtp.gmail.com",
 :port => "587",
 :domain => "gmail.com",
 :authentication => :plain,
 :user_name => MAILER_CONFIG["user_name"],
 :password => MAILER_CONFIG["password"]
}
