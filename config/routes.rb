Rails.application.routes.draw do
  get 'static_pages/home'

  devise_for :caregivers
  devise_for :admins
  devise_for :users

  authenticated :user do
    root to: "users#index", as: :authenticated_root
  end

  unauthenticated do
    root to: "static_pages#home", as: :unauthenticated_root
  end

  resources :users, only: [:show]
  resources :posts, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
