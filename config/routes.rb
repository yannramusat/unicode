Rails.application.routes.draw do
  resources :favorites
  resources :users
  resources :characters
  namespace :api do
    namespace :v1 do
      resources :characters, :defaults => { :format => 'json' }
      resources :users, :defaults => { :format => 'json' } do
        resources :characters, controller: :user_characters, :defaults => { :format => 'json' }
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
