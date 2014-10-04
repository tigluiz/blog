Rails.application.routes.draw do
  resources :articles, only: [:index, :create, :show] do
    resources :comments
  end
  root "articles#index"
end
