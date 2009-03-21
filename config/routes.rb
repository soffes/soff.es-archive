ActionController::Routing::Routes.draw do |map|
	map.resources :posts, :has_many => :comments
	map.music 'music', :controller => 'music'
	map.about 'about', :controller => 'about'

	map.connect ':controller/:action/:id', :controller => 'posts'
	map.connect ':controller/:action/:id.:format'
end
