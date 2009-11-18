Refraction.configure do |req|

  preferred_host = "new.samsoff.es"
  development_host = "samsoffes.local"

  # Rewrite all of the aliases to the preferred host unless on development
  if req.host != preferred_host && req.host != development_host && req.host != "localhost"
    req.permanent! "#{req.scheme}://#{preferred_host}#{req.path}"
  end

  # Post permalink
  if req.path =~ /post\/(.*)/
    req.permanent! "/posts/#{$1}"
  end
  
  # Home
  if req.path == "/home"
    req.permanent! "/"
  end
  
  # About
  if req.path == "/about.html" || req.path =~ /\/contact(?:\.html)?/
    req.permanent! "/about"
  end
  
  # Music
  if req.path == "/music.html"
    req.permanent! "/music"
  end
  
  # Podcast
  if req.path == "/the-experiment"
    req.permanent! "http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewPodcast?id=292395055"
  end
  
end
