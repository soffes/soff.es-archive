require 'sam_soffes/render_directly'

SamSoffes::Application.routes.draw do |map|
  extend GenericActions::Render
  
  # Rewrite samsoffes.com URLs
  # This could be cleaner, but it works for now
  constraints :host => /(?:www\.)?samsoffes\.com/ do
    match "/:path" => redirect { |params| "http://samsoff.es/#{params[:path]}" }
  end
  
  # Blog
  match "/" => "posts#index", :as => "root"
  resources :posts, :only => [:index, :show]
  resources :tags, :only => [:index, :show]
  
  # About
  match "/about" => "about#index", :as => "about"
  
  # Static pages
  match "/music" => render("pages/music"), :as => "music"
  match "/clearance" => render("pages/clearance"), :as => "clearance"
  
  # Redirects
  match "/blog" => redirect { |params| "/" }, :as => "blog"
  match "/posts" => redirect { |params| "/" }
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
