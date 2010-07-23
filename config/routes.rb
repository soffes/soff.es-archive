SamSoffes::Application.routes.draw do |map|
  
  # Rewrite no preferred hosts
  constraints(NotPreferredHost) do
    match "/:path" => redirect { |params| "http://#{PREFERRED_HOST}/#{params[:path]}" }
  end
  
  # Root
  match "/" => "home#index", :as => "root"
      
  # Blog
  match "/blog" => "posts#index", :as => "blog"
  resources :posts, :only => [:show]
  resources :tags, :only => [:index, :show]
  
  # Static pages
  match "/about" => "pages#about", :as => "about"
  match "/music" => "pages#music", :as => "music"
  match "/clearance" => "pages#clearance", :as => "clearance"
  match "/talks" => "pages#talks", :as => "talks"
  match "/orange" => "pages#orange", :as => "orange"
  match "/hello-internet" => "pages#hello_internet", :as => "hello_internet"
  
  # Redirects
  match "/posts" => redirect { |params| "/blog" }
  match "/post/:permalink" => redirect { |params| "/posts/#{params[:permalink]}" }
  match "/archive.:format" => redirect { |params| "/blog" }
  match "/music.:format" => redirect { |params| "/music" }
  match "/about.:format" => redirect { |params| "/about" }
  match "/mobilex" => redirect { |params| "/talks" }
  match "/tags/hello-internet" => redirect { |params| "/hello-internet" }
  match "/tags/hellointernet" => redirect { |params| "/hello-internet" }
  match "/hellointernet" => redirect { |params| "/hello-internet" }
  
  # Awesome source redirects
  match "/source(/:code_path)" => redirect { |params|
    code_path = params[:code_path] ? "/tree/master/#{params[:code_path]}" : ""
    "http://github.com/samsoffes/samsoff.es#{code_path}"
  }, :constraints => { :code_path => /[a-zA-Z0-9_\.\/]+/ }
  
  # Admin
  namespace :admin do
    match "/" => "admin#index", :as => "admin"
    resources :posts
    resources :tags
  end

end
