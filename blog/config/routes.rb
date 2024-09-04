Rails.application.routes.draw do
  get 'index/new'
  get 'index/show'
  get 'user_sessions/new'
  post 'user_sessions/new', to: "user_sessions#create"
  get '/logout', to: "user_sessions#destroy"
  #post 'user_sessions/create', to: "user_sessions#create"
root "articles#index"
get "/Signup" , to: "users#new" , as: 'user'

resources :articles do
  resources :comments
end

resources :users, only: [:new , :index , :show, :create]
resources :user_sessions , only: [:new,:destroy]

resources :contacts
resources :messengers
resources :private_messages

#get "log_in", to: "user_sessions#new"
#post "log_in", to: "user_sessions#create"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
