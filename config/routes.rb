Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root to: "main#index"

  namespace :api do
    namespace :v1 do
      post 'authentication/create'
      get 'sessions/create'
      resources :legal_entities, only: %i[index show create destroy]
    end
  end
end
