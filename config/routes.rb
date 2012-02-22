require 'not_preferred_host'

SamSoffes::Application.routes.draw do

  # Rewrite non-preferred hosts in production
  constraints(NotPreferredHost) do
    match '/:path' => redirect { |params, request| "http://#{NotPreferredHost::PREFERRED_HOST}/#{params[:path]}" }
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
  match '/about' => 'pages#about', :as => 'about'
  match '/talks' => 'pages#talks', :as => 'talks'

  # Redirects
  match '/posts' => redirect('/blog')
  match '/post/:permalink' => redirect { |params, request| "/posts/#{params[:permalink]}" }
  match '/archive.:format' => redirect('/blog')
  match '/music.:format' => redirect('/music')
  match '/about.:format' => redirect('/about')
  match '/mobilex' => redirect('/talks')
  match '/:hellointernet' => redirect { |params, request| '/tags/hello-internet' }, :constraints => { :hellointernet => /hello[_-]?internet/ }
  match '/resume(.:format)' => redirect('http://assets.samsoff.es/pdf/Sam%20Soffes%20Resume.pdf'), :as => 'resume'
  match '/ping' => redirect(PING_PROFILE_URL)

  # Awesome source redirects
  match '/source(/:code_path)' => redirect { |params, request|
    code_path = params[:code_path] ? "/tree/master/#{params[:code_path]}" : ''
    "http://github.com/samsoffes/samsoff.es#{code_path}"
  }, :constraints => { :code_path => /[a-zA-Z0-9_\-\.\/]+/ }

  # Admin
  namespace :admin do
    root :to => 'admin#index'
    resources :posts, :only => [:show, :new, :create, :update, :edit, :destroy, :index]
    resources :tags, :only => [:new, :create, :update, :edit, :destroy, :index]
  end

  match 'blog/xmlrpc' => 'posts#xe_index', :format => :xml

end
