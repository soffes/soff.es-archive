require 'sam_soffes/render_directly'

SamSoffes::Application.routes.draw do |map|
  extend GenericActions::Render
  
  match "/" => "posts#index", :as => "root"
  match "/music" => render("pages/music"), :as => "music"
  match "/about" => render("pages/about"), :as => "about"
  match "/clearance" => render("pages/clearance"), :as => "clearance"
  
  match "/blog" => redirect { |params| "/" }, :as => "blog"
  match "/post/:permalink" => redirect { |params| "/posts/#{params[:permalink]}" }
  match "/archive" => redirect { |params| "/posts" }
  resources :posts #, :only => [:show]
  resources :tags #, :only => [:index, :show]

end
