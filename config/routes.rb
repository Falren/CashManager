Rails.application.routes.draw do
  get 'articles/new'
  get 'articles/create'
  get 'articles/edit'
  get 'articles/update'
  get 'articles/delete'
  devise_for :users
  resources :companies
  resources :articles
  resources :transactions
  root 'companies#index'
end
