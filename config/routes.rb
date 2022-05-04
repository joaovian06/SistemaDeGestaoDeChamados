Rails.application.routes.draw do
  root 'treatments#index'
  # devise_for :users
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :treatments
  resources :consultants
  resources :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
