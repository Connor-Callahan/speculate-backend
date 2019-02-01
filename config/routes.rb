Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create]
      resources :transactions, only: [:index, :show, :create, :destroy]
    end
  end
end
