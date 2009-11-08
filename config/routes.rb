ActionController::Routing::Routes.draw do |map|

  # Blog
  map.resources :posts, :has_many => :comments
  map.blog "blog", :controller => "posts"
  map.resources :categories
  
  # Static Pages
  map.root :controller => "home"
  map.music "music", :controller => "music"
  map.about "about", :controller => "about"

end
