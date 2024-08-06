Rails.application.routes.draw do

  # root to: 'home#index'
  constraints subdomain: /.*/ do
    root to: 'users#index'
    devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations', confirmations: 'users/confirmations' }
    resources :users
  end

  
end
