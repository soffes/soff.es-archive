class NotPreferredHost
  def self.matches?(request)
    Rails.env == "production" && request.host != PREFERRED_HOST
  end
end
