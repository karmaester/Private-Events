Rails.application.routes.draw do
  resources :attendances
  resources :users
  resources :events
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :events
  resources :sessions, only: [:new, :create, :show, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'events#index'

  get 'sign_up',  to:  'users#new'
  get 'login',  to:  'sessions#new'
  post 'login' ,  to: 'sessions#create'
  get 'logout' => 'sessions#destroy', as: 'logout'

  get 'attend' => 'attendances#create', as: 'attend'
end
