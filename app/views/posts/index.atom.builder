atom_feed do |feed|
  feed.title("samsoff.es")
  feed.updated(@posts.first.published_at)
  
  @posts.each do |post|
    feed.entry(post) do |entry|
      entry.title(post.title)
      entry.content(markdown(post), :type => "html")
      entry.author { |author| author.name("Sam Soffes") }
    end
  end
end
