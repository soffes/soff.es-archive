require 'sam_soffes/render_directly'

SamSoffes::Application.routes.draw do |map|
  extend GenericActions::Render
  
  match "/", :to => render("pages/home"), :as => "root"
  match "/music", :to => render("pages/music"), :as => "music"
  match "/about", :to => render("pages/about"), :as => "about"
  match "/clearance", :to => render("pages/clearance"), :as => "clearance"
  
  match "/blog", :to => "posts#index", :as => "blog"
  match "/post/:permalink", :to => redirect { |params| "/posts/#{params[:permalink]}" }
  match "/archive", :to => redirect { |params| "/posts" }
  resources :posts #, :only => [:show]
  resources :tags #, :only => [:index, :show]

end
