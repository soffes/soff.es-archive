module PostsHelper
  def post_excerpt(post)
    post.html_content.html_safe.split('</p>').first+'</p>'.html_safe
  end

  def post_tags_html post
    tags = post.tags.order 'name'
    return '' if !tags || tags.length == 0

    links = []
    tags.each do |tag|
      links << link_to(tag.name, tag, :class => 'tag')
    end
    (' in '+links.to_sentence).html_safe
  end

  def post_published_time_in_words post
    words = time_ago_in_words(post.published_at)
    if post.published?
      "#{words} ago"
    else
      "in #{words}"
    end
  end
  
  def post_summary(post)
    doc = Nokogiri::HTML(post.html_content)
    doc.xpath("//text()").remove.to_s.truncate(200)
  end
end
