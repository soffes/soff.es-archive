module ApplicationHelper
  
  def markdown(text)
    (text && !text.empty?) ? RDiscount.new(text).to_html : ""
  end
  
end
