Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  root to: "posts#index"
  resources :posts, except: [:index] do
  resources :posts
  resources :comments, only: :create
  collection do
    get 'search'
  end
end
resources :users, only: [:show, :update]
devise_scope :user do
  post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
end
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
  post 'like/:id' => 'likes#create', as: 'create_like'
end
