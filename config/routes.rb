SamSoffes::Application.routes.draw do
  # Blog
  root to: 'posts#index'
  match '/blog/:page', to: 'posts#index', as: 'blog_page'
  match '/posts.:format', to: 'posts#index'
  match '/posts', to: redirect('/')
  resources :posts, only: [:show]
  resources :tags, only: [:index, :show]

  # Static pages
  match '/music', to: 'pages#music', as: 'music'
  match '/about', to: 'pages#about', as: 'about'
  match '/talks', to: 'pages#talks', as: 'talks'
  match '/projects', to: 'pages#projects', as: 'projects'

  # Redirects
  match '/blog', to: redirect('/')
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
    "https://github.com/soffes/soff.es#{code_path}"
  }, constraints: { code_path: /[a-zA-Z0-9_\-\.\/]+/ }

  # Admin
  namespace :admin do
    root to: 'admin#index'
    resources :posts, only: [:show, :new, :create, :update, :edit, :destroy, :index]
    resources :tags,  only: [:new, :create, :update, :edit, :destroy, :index]
  end
end
