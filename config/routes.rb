ActionController::Routing::Routes.draw do |map|

  # Blog
  map.resources :posts
  map.post_slug "post/:slug", :controller => "posts", :action => "show"
  map.blog "blog", :controller => "posts"
  map.resources :comments
  
  # Static Pages
  map.root :controller => "home"
  map.music "music", :controller => "music"
  map.about "about", :controller => "about"

end
