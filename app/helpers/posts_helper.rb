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

  def post_published_time post
    post.published_at.strftime('%B %e, %Y')
  end
  
  def post_summary(post)
    key = "post-#{post.id}-summary"
    summary = Rails.cache.read(key)
    unless summary
      doc = Nokogiri::HTML(post.html_content)
      summary = doc.xpath("//text()").remove.to_s.truncate(200)
      Rails.cache.write(key, summary)
    end
    summary
  end
end
