Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  namespace :api do
    namespace :v1 do
      resources :products, only: [:create, :update]
    end
  end
  
  
end
