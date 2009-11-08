require "rdiscount"

module ApplicationHelper
  
  def markdown(text)
    text.blank? ? "" : RDiscount.new(text).to_html
  end
  
  def iphone?
    request.user_agent.include?("iPhone")
  end

end
