Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resource :my_profiles, only: [ :edit, :update, :show ]

  resources :profiles, only: [ :index, :show] do
    member do
      post :follow
      post :unfollow
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "dashboard", to: "pages#dashboard", as: :dashboard
  resources :lessons do
    resources :meetings, only: [ :create ]
    resources :wishlist_items, only: [ :create ]
  end

  resources :wishlist_items, only: [:destroy]
  resources :meetings, only: [ :edit, :update, :destroy ]
end
