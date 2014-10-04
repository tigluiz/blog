Rails.application.routes.draw do
  resources :articles, only: [:index, :create, :show]
  root "articles#index"
end
