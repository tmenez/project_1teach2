Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resource :my_profiles, only: [ :edit, :update, :show ]

  resources :profiles, only: [ :index, :show]
end
