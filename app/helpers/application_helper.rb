require "rdiscount"

module ApplicationHelper
  
  def markdown(text)
    text.blank? ? "" : RDiscount.new(text).to_html
  end
  
  def iphone?
    false #request ? request.user_agent.include?("iPhone") : false
  end

end
