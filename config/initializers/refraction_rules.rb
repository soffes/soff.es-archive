Refraction.configure do |req|

  # /post/:permalink -> /posts/:permalink
  if req.path =~ /post\/(.*)/
    req.permanent! "/posts/#{$1}"
  end
  
  # /home -> /
  if req.path == "/home"
    req.permanent! "/"
  end
  
end
