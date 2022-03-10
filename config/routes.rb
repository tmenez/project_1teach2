Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get '/pages/user/:id', to: 'pages#profile', as: :profile
end
