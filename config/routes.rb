ActionController::Routing::Routes.draw do |map|
	# TODO: figure out how to route posts correctly
	map.resources :posts, :has_many => :comments
	
	# Static pages
	map.music 'music', :controller => 'music'
	map.about 'about', :controller => 'about'

	map.connect ':controller/:action/:id', :controller => 'posts'
	map.connect ':controller/:action/:id.:format'
end
