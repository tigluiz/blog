Rails.application.routes.draw do
  resources :articles, only: [:index, :create]
  root "articles#index"
end
