ActionController::Routing::Routes.draw do |map|

  map.root :controller => "home"

  map.resources :posts
  map.resources :tags

end
