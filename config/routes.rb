# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :companies, except: :destroy do
    scope module: 'companies' do
      resources :transactions, except: :destroy
      resources :reports, only: :index
    end
  end
  resources :articles
  root 'companies#index'
end
