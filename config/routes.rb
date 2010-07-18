class NotPreferredHost
  def self.matches?(request)
    Rails.env == "production" && request.host != PREFERRED_HOST
  end
end

SamSoffes::Application.routes.draw do |map|
  
  # Rewrite no preferred hosts
  constraints(NotPreferredHost) do
    match "/:path" => redirect { |params| "http://#{PREFERRED_HOST}/#{params[:path]}" }
  end
  
  # Redirects
  match "/posts" => redirect { |params| "/blog" }
  match "/post/:permalink" => redirect { |params| "/posts/#{params[:permalink]}" }
  match "/archive.:format" => redirect { |params| "/blog" }
  match "/music.:format" => redirect { |params| "/music" }
  match "/about.:format" => redirect { |params| "/about" }
  match "/mobilex" => redirect { |params| "/talks" }
  
  # Root
  match "/" => "home#index", :as => "root"
  match "/source(/:code_path)" => "home#source"
    
  # Blog
  match "/blog" => "posts#index", :as => "blog"
  resources :posts, :only => [:index, :show]
  resources :tags, :only => [:index, :show]
  
  # Static pages
  match "/about" => "pages#about", :as => "about"
  match "/music" => "pages#music", :as => "music"
  match "/clearance" => "pages#clearance", :as => "clearance"
  match "/talks" => "pages#talks", :as => "talks"
  
  # Admin
  namespace :admin do
    match "/" => "admin#index", :as => "admin"
    resources :posts
    resources :tags
  end

end
