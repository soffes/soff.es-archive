ActionController::Routing::Routes.draw do |map|

  # Blog
  map.resources :posts, :has_many => :comments
  map.post_slug "post/:slug", :controller => "posts", :action => "show"
  map.blog "blog", :controller => "posts"
  
  # Static Pages
  map.root :controller => "home"
  map.music "music", :controller => "music"
  map.about "about", :controller => "about"

end
