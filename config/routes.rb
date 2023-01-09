Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root to: "main#index"

  namespace :api do
    namespace :v1 do
      post 'authentication/create'
      get 'sessions/create'
      resources :users, only: %i[create show update]
      resources :entity_codes, only: %i[create]
      resources :legal_entities, only: %i[index show create destroy]
      resources :quotes, only: %i[index create]
      resources :nacebel_codes, only: %i[index]
    end
  end
end
