Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:update, :show] do
    resources :items, only: [:create]
  end
  root 'welcome#index'
end
