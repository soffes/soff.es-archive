module PostsHelper
  def post_excerpt(post)
    markdown(post.content).split('</p>').first+'</p>'.html_safe
  end
  
  def markdown(text)
    options = [:hard_wrap, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]
    syntax_highlighter(Redcarpet.new(text, *options).to_html).html_safe
  end

  def syntax_highlighter(html)
    doc = Nokogiri::HTML(html)
    doc.search("//pre[@lang]").each do |pre|
      pre.replace Albino.colorize(pre.text.rstrip, pre[:lang])
    end
    doc.to_s
  end
  
  def post_tags_html post 
    tags = post.tags.order 'name'
    return '' if !tags || tags.length == 0
    
    links = []
    tags.each do |tag|
      links << link_to(tag.name, tag, class: 'tag')
    end
    (' in '+links.to_sentence).html_safe
  end
  
  def post_published_time_in_words post
    return 'not published' unless post.published?
    words = time_ago_in_words(post.published_at)
    if post.published?
      "#{words} ago"
    else
      "in #{words}"
    end
  end
end
