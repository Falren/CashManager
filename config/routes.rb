# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :companies do
    scope module: 'companies' do
      resources :transactions
      resources :reports, only: :index
    end
  end
  resources :articles
  root 'companies#index'
end
