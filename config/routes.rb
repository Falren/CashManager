Rails.application.routes.draw do
  devise_for :users
  resources :companies do
    scope module: "company" do
      resources :transactions
      resources :reports, only: :index
    end
  end
  resources :articles
  root 'companies#index'
end
