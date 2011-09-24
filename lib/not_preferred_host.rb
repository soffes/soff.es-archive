class NotPreferredHost
  PREFERRED_HOST = "samsoff.es"

  def self.matches?(request)
    Rails.env == "production" && request.host != PREFERRED_HOST
  end
end
