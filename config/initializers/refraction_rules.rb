Refraction.configure do |req|

  # Update post permalink
  if req.path =~ /post\/(.*)/
    req.permanent! "/posts/#{$1}"
  end
  
end
