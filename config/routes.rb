require 'not_preferred_host'

SamSoffes::Application.routes.draw do |map|
  
  # Rewrite non-preferred hosts in production
  constraints(NotPreferredHost) do
    match '/:path' => redirect { |params| "http://#{NotPreferredHost::PREFERRED_HOST}/#{params[:path]}" }
  end
  
  # Root
  root :to => 'pages#home'
      
  # Blog
  match '/posts.:format' => 'posts#index'
  match '/blog' => 'posts#index', :as => 'blog'
  resources :posts, :only => [:show]
  resources :tags, :only => [:index, :show]
  
  # Static pages
  match '/music' => 'pages#music', :as => 'music'
  match '/work' => 'pages#work', :as => 'work'
  match '/about' => 'pages#about', :as => 'about'
  match '/talks' => 'pages#talks', :as => 'talks'
  match '/orange' => 'pages#orange', :as => 'orange'
  match '/hello-internet' => 'pages#hello_internet', :as => 'hello_internet'
  match '/open-source' => 'pages#open_source', :as => 'open_source'
  
  # Redirects
  match '/posts' => redirect { |params| '/blog' }
  match '/post/:permalink' => redirect { |params| "/posts/#{params[:permalink]}" }
  match '/archive.:format' => redirect { |params| '/blog' }
  match '/music.:format' => redirect { |params| '/music' }
  match '/about.:format' => redirect { |params| '/about' }
  match '/mobilex' => redirect { |params| '/talks' }
  match '/:hellointernet' => redirect { |params| '/hello-internet' }, :constraints => { :hellointernet => /hello_?internet/ }
  match '/resume(.:format)' => redirect { |params| 'http://assets.samsoff.es/pdf/Sam%20Soffes%20Resume.pdf' }, :as => 'resume'
  # match '/:opensource' => redirect { |params| '/open-source' }, :constraints => { :opensource => /open[\-_]?source(?:[\-_]?projects)?/ }
  match '/ping' => redirect { |params| PING_PROFILE_URL }
  
  # Awesome source redirects
  match '/source(/:code_path)' => redirect { |params|
    code_path = params[:code_path] ? "/tree/master/#{params[:code_path]}" : ''
    "http://github.com/samsoffes/samsoff.es#{code_path}"
  }, :constraints => { :code_path => /[a-zA-Z0-9_\-\.\/]+/ }
  
  # Admin
  namespace :admin do
    root :to => 'admin#index', :as => 'admin'
    resources :posts
    resources :tags
  end

end
