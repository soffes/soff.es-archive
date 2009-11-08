xml.rss :version => "2.0" do
  xml.channel do 
    xml.title 'Sam Soffes'
    xml.link 'http://samsoff.es'
    xml.description 'TODO: Write description'
    xml.language 'en'
    xml.pubDate @posts.first.created_at.to_s(:rfc822)
    xml.lastBuildDate @posts.first.created_at.to_s(:rfc822)
    
    @posts.each do |post|
      xml.item do
        xml.title post.title
        xml.description markdown(post.content)
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.link post_url(post)
        xml.guid({:isPermaLink => 'true'}, post_url(post))
      end      
    end
  end
end
