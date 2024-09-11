Rails.application.routes.draw do
#devise_for :user,
#controllers: {
#   omniauth_callbacks: 'users/omniauth_callbacks'
#}

  get 'user_teams/index'
  get 'user_teams/show'
  get 'user_teams/new'
  get 'team_posts/index'
  get 'team_posts/show'
  get 'team_posts/new'
  get 'teams/index'
  get 'teams/new'
  get 'teams/show'
  get 'index/new'
  get 'index/show'
  get 'user_sessions/new'
  post 'user_sessions/new', to: "user_sessions#create"
  get '/logout', to: "user_sessions#destroy"
  get 'teams/owner' , to: "teams#owner"
  get 'messengers/block' , to: "messengers#block"
  #get 'private_messages/popup' , to: "messengers#popup"
  get 'messengers/add_to_contact' , to: "messengers#add_to_contact"
  post 'messengers/invite_to_team' , to: "messengers#invite_to_team"
  #post 'user_sessions/create', to: "user_sessions#create"
root "home#index"

get 'login', to: 'logins#new'
get 'login/create', to: 'logins#create', as: :create_login

resources :articles do
  resources :comments
end

resources :users
resources :user_sessions

resources :contacts
resources :messengers
resources :private_messages

resources :teams do
  resources :team_posts
end

resources :user_teams

get "/Signup" , to: "users#new"
#get "log_in", to: "user_sessions#new"
#post "log_in", to: "user_sessions#create"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
