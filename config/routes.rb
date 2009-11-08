ActionController::Routing::Routes.draw do |map|
  map.resources :categories


  # Blog
  map.resources :posts, :as => "post", :has_many => :comments
  map.blog "blog", :controller => "posts"
  
  # Static Pages
  map.root :controller => "home"
  map.music "music", :controller => "music"
  map.about "about", :controller => "about"

end
