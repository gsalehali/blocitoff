Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:update, :show, :index]
  root 'welcome#index'
end
