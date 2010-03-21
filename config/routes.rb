require 'sam_soffes/render_directly'

class NotPreferredHost
  def self.matches?(request)
    Rails.env == "production" && request.host != PREFERRED_HOST
  end
end

SamSoffes::Application.routes.draw do |map|
  extend GenericActions::Render
  
  # Rewrite no preferred hosts
  constraints(NotPreferredHost) do
    match "/:path" => redirect { |params| "http://#{PREFERRED_HOST}/#{params[:path]}" }
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
