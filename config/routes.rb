Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resource :my_profiles, only: [ :index, :edit, :update, :show ] do
    member do
      post :follow
      post :unfollow
    end
  end

  resources :profiles, only: [ :index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "dashboard", to: "pages#dashboard", as: :dashboard
  resources :lessons

end
