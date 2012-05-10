require 'not_preferred_host'

SamSoffes::Application.routes.draw do

  # Rewrite non-preferred hosts in production
  constraints(NotPreferredHost) do
    match '/:path', to: redirect { |params, request| "http://#{NotPreferredHost::PREFERRED_HOST}/#{params[:path]}" }
  end

  # Blog
  root to: 'pages#home'
  match '/blog/:page', to: 'posts#index', as: 'blog_page'
  match '/posts.:format', to: 'posts#index'
  resources :posts, only: [:index, :show]
  resources :tags, only: [:index, :show]

  # Static pages
  match '/music', to: 'pages#music', as: 'music'
  match '/about', to: 'pages#about', as: 'about'
  match '/talks', to: 'pages#talks', as: 'talks'
  match '/projects', to: 'pages#projects', as: 'projects'

  # Redirects
  match '/blog', to: redirect('http://blog.samsoff.es/')
  match '/post/:permalink', to: redirect { |params, request| "/posts/#{params[:permalink]}" }
  match '/archive.:format', to: redirect('/blog')
  match '/music.:format', to: redirect('/music')
  match '/about.:format', to: redirect('/about')
  match '/mobilex', to: redirect('/talks')
  match '/:hellointernet', to: redirect { |params, request| '/tags/hello-internet' }, constraints: { hellointernet: /hello[_-]?internet/ }
  match '/resume(.:format)', to: redirect('http://assets.samsoff.es/pdf/Sam%20Soffes%20Resume.pdf'), as: 'resume'

  # Awesome source redirects
  match '/source(/:code_path)' => redirect { |params, request|
    code_path = params[:code_path] ? "/tree/master/#{params[:code_path]}" : ''
    "http://github.com/samsoffes/samsoff.es#{code_path}"
  }, constraints: { code_path: /[a-zA-Z0-9_\-\.\/]+/ }

  # Admin
  namespace :admin do
    root to: 'admin#index'
    resources :posts, only: [:show, :new, :create, :update, :edit, :destroy, :index]
    resources :tags,  only: [:new, :create, :update, :edit, :destroy, :index]
  end
end
