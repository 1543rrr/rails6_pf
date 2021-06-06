Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  root to: "posts#index"
  resources :posts, except: [:index] do
  resources :posts
  resources :comments, only: :create
end
resources :users, only: [:show, :update]
end
