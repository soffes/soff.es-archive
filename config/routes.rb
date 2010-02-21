require 'sam_soffes/render_directly'

SamSoffes::Application.routes.draw do |map|
  extend GenericActions::Render
  
  # Blog
  match "/" => "posts#index", :as => "root"
  resources :posts #, :only => [:show]
  resources :tags #, :only => [:index, :show]
  
  # Static pages
  match "/music" => render("pages/music"), :as => "music"
  match "/about" => render("pages/about"), :as => "about"
  match "/clearance" => render("pages/clearance"), :as => "clearance"
  
  # Redirects
  match "/blog" => redirect { |params| "/" }, :as => "blog"
  match "/post/:permalink" => redirect { |params| "/posts/#{params[:permalink]}" }
  match "/archive(.:format)" => redirect { |params| "/posts" }
  match "/music(.:format)" => redirect { |params| "/music" }
  match "/about(.:format)" => redirect { |params| "/about" }
  match "/source" => redirect { |params| "http://github.com/samsoffes/samsoff.es" }
  
  # Admin
  namespace :admin do
    match "/" => "admin#index", :as => "admin"
    resources :posts
    resources :tags
  end

end
