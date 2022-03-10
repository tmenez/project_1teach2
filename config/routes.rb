Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resource :my_profiles, only: [ :edit, :update, :show ]
end
