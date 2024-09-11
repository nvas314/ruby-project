Rails.application.routes.draw do
  #mount Rswag::Ui::Engine => '/ui-docs'
  #mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/ui-docs'
  mount Rswag::Api::Engine => '/api-docs'
    resources :todos do
      resources :items
    end



    post '/auth/login', to: "auth#create"
    get '/auth/logout', to: "auth#index"
    post '/signup', to: "users#create"
    
  end
end
