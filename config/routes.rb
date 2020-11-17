Rails.application.routes.draw do
  devise_for :users
  resources :companies
  resources :articles
  resources :transactions
  root 'companies#index'
end
