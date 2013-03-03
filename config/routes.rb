Soffes::Application.routes.draw do
  # Blog
  root to: 'posts#index'
  get '/posts.:format', to: 'posts#index'

  resources :tags, only: [:index, :show]

  # Static pages
  get '/music', to: 'pages#music', as: 'music'
  get '/about', to: 'pages#about', as: 'about'
  get '/talks', to: 'pages#talks', as: 'talks'
  get '/projects', to: 'pages#projects', as: 'projects'

  # Redirects
  get '/blog', to: redirect('/')
  get '/posts', to: redirect('/')
  get '/post/:permalink', to: redirect { |params, request| "/#{params[:permalink]}" }
  get '/posts/:permalink', to: redirect { |params, request| "/#{params[:permalink]}" }
  get '/blog/:page', to: redirect { |params, request| "/#{params[:page]}" }
  get '/archive.:format', to: redirect('/blog')
  get '/music.:format', to: redirect('/music')
  get '/about.:format', to: redirect('/about')
  get '/mobilex', to: redirect('/talks')
  get '/:hellointernet', to: redirect { |params, request| '/tags/hello-internet' }, constraints: { hellointernet: /hello[_-]?internet/ }
  get '/resume(.:format)', to: redirect('http://assets.samsoff.es/pdf/Sam%20Soffes%20Resume.pdf'), as: 'resume'

  # Awesome source redirects
  get '/source(/:code_path)' => redirect { |params, request|
    code_path = params[:code_path] ? "/tree/master/#{params[:code_path]}" : ''
    "https://github.com/soffes/soff.es#{code_path}"
  }, constraints: { code_path: /[a-zA-Z0-9_\-\.\/]+/ }

  # Admin
  namespace :admin do
    root to: 'admin#index'
    resources :posts, only: [:show, :new, :create, :update, :edit, :destroy, :index]
    resources :tags,  only: [:new, :create, :update, :edit, :destroy, :index]
  end

  # Pagination
  get '/:page', to: 'posts#index', as: 'blog_page', constraints: { page: /[0-9]+/}

  # Post
  get ':permalink', to: 'posts#show', as: 'post'
end
