SamSoffes::Application.routes.draw do |map|
  resources :tags

  match "/", :to => "home#index", :as => "root"
  match "/blog", :to => "home#index", :as => "blog"
  match "/music", :to => "home#index", :as => "music"
  match "/about", :to => "home#index", :as => "about"
  resources :posts

end
