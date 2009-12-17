ActionController::Routing::Routes.draw do |map|

  map.root :controller => "home"

  map.resources :posts
  map.resources :tags
  
  map.blog "blog", :controller => "posts"
  map.about "about", :controller => "about"

end
