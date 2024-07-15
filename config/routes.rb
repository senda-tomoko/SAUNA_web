Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  mount Spree::Core::Engine, at: '/'

  root to: 'home#index'
  resources :reservations
  resource :cart, only: [:show]
end
