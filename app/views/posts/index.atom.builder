atom_feed do |feed|
  feed.title("samsoff.es")
  feed.updated(@posts.first.published_at)
  
  @posts.each do |post|
    feed.entry(post) do |entry|
      entry.title(post.title)
      entry.content(post.to_html, :type => "html")
      entry.author { |author| author.name("Sam Soffes") }
    end
  end
end
