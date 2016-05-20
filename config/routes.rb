Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

  root 'static_pages#home'
  get 'static_pages/help'

  get 'static_pages/about'
  get 'static_pages/contact'
  get 'login'   => 'sessions#new'
  post 'login'   => 'sessions#create'
  get 'signup'  => 'users#new'
  delete 'logout' =>'sessions#destroy'
  delete 'delete'=>'users#destroy'
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts
  resources :relationships,       only: [:create, :destroy]
  resources :users do
    member do
      get :following, :followers
    end
  end

end

