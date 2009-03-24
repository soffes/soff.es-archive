require 'rdiscount'

module ApplicationHelper
  def markdown(str)
    Markdown.new(str).to_html
  end
end
