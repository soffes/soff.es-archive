ActionController::Routing::Routes.draw do |map|
	map.resources :posts, :has_many => :comments
	map.post_slug 'post/:slug', :controller => 'posts', :action => 'show'
	
	map.music 'music', :controller => 'music'
	map.about 'about', :controller => 'about'

  map.root :posts
end
