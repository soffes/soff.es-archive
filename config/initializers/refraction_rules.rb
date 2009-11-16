Refraction.configure do |req|

  preferred_host = "new.samsoff.es"

  # Rewrite all of the aliases to the preferred host
  if req.host != preferred_host
    req.permanent! "#{req.scheme}://#{preferred_host}#{req.path}"
  end

  # /post/:permalink -> /posts/:permalink
  if req.path =~ /post\/(.*)/
    req.permanent! "/posts/#{$1}"
  end
  
  # /home -> /
  if req.path == "/home"
    req.permanent! "/"
  end
  
end
