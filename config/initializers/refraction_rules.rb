Refraction.configure do |req|

  # /post/:permalink -> /posts/:permalink
  if req.path =~ /post\/(.*)/
    req.permanent! "/posts/#{$1}"
  end
  
  # /posts -> /blog
  if req.path == "/posts"
    req.permanent! "/blog"
  end
  
  # /home -> /
  if req.path == "/home"
    req.permanent! "/"
  end
  
end
