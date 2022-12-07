Rails.application.routes.draw do
 # resources :pages
 #the above line makes routes for a resource automatically that match the following routes
  get '/pages', to: 'pages#index'
  get '/pages/new', to: 'pages#new', as: 'new_page'
  get '/pages/:id', to: 'pages#show', as: 'page'
  post '/pages', to: 'pages#create'
  get 'pages/:id/edit', to: 'pages#edit', as: 'edit_page'
  patch '/pages/:id', to: 'pages#update'
  delete '/pages/:id', to: 'pages#destroy'
  resources :posts do
  #comments routing
  #Nesting this in a block under the :posts routes adds the posts prefix to comments route name
  #Likewise, these can replaced with "resources :comments" to the same effect
    get    '/comments',          to: 'comments#index', as: 'comments'
    post   '/comments',          to: 'comments#create'
    get    '/comments/new',      to: 'comments#new',   as: 'new_comment'
    get    '/comments/:id',      to: 'comments#show',  as: 'comment'
    get    '/comments/:id/edit', to: 'comments#edit',  as: 'edit_comment'
    patch  '/comments/:id',      to: 'comments#update'
    delete '/comments/:id',      to: 'comments#destroy'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
