ActionController::Routing::Routes.draw do |map|
  map.home '', :controller => 'posts', :action => 'index'
	map.resources :posts, :has_many => :comments
#	map.connect 'page/:page',
#    :controller => 'posts',
#    :action => 'index',
#    :requirements => { :page => /\d+/},
#    :page => nil
	map.post_slug 'post/:slug', :controller => 'posts', :action => 'show'
	
	# Static pages
	map.music 'music', :controller => 'music'
	map.about 'about', :controller => 'about'

	#map.connect ':controller/:action/:id'
	#map.connect ':controller/:action/:id.:format'
end
