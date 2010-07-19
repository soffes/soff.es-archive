module PostsHelper
  def post_tags_html(post)
    tags = post.tags.order("name")
    return "" if !tags || tags.length == 0
    
    links = []
    tags.each do |tag|
      links << link_to(tag.name, tag, :class => "tag")
    end
    (" in "+links.to_sentence).html_safe
  end
end
