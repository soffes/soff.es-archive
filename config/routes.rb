ActionController::Routing::Routes.draw do |map|
  map.resources :comments


  map.root :controller => "home"
  map.resources :posts, :only => [:index, :show]
  map.resources :tags
  map.blog "blog", :controller => "posts"
  map.about "about", :controller => "about"
  map.music "music", :controller => "music"
  map.stats "stats", :controller => "stats"
  
  # Admin
  map.admin "admin", :controller => "admin"
  map.resources :posts, :controller => "admin/posts", :path_prefix => "admin", :name_prefix => "admin_"
  map.resources :comments, :controller => "admin/comments", :path_prefix => "admin", :name_prefix => "admin_"
  map.resources :tags, :controller => "admin/tags", :path_prefix => "admin", :name_prefix => "admin_"

end
