Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'

  resources :relationships, only: [:create, :destroy]
  resources :microposts, only: [:create, :destroy]
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :users do
    member do
      get :following, :followers
    end
  end

  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'

  get '/signup', to: 'users#new', as: 'signup'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
