Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  root to: "static_pages#index"
  resources :posts do
  # resources :posts, except: [:index] do
  resources :comments, only: [:create, :destroy]
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