require 'maruku'

module ApplicationHelper
  def markdown(text)
    text.blank? ? "" : Maruku.new(text).to_html
  end  
end
