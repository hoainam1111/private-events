Rails.application.routes.draw do

  devise_for :users
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end
  root to: 'events#index'
  resources :events do
    resources :attendances
  end
  resources :users
end
