Refraction.configure do |req|

  # Update post permalink
  if req.path =~ /post\/(.*)/
    req.permanent! "/posts/#{$1}"
  end
  
  # /posts -> /blog
  if req.path == "/posts"
    req.permanent! "/blog"
  end
  
end
