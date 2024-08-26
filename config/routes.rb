Rails.application.routes.draw do
  get "users/show"
  devise_for :users
  root to: 'events#index'
  resources :events
end
