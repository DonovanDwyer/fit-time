Rails.application.routes.draw do
  resources :images
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :new, :create]
  resources :workouts, only: [:show, :new, :create, :edit, :destroy, :update]
  # resources :workout_joins, only: [:new, :create, :destroy]
  resources :exercises

  get '/users/:id/create_workout/new', to: "users#new_workout", as: "create_new_workout"
  post '/users/:id/create_workout', to: "users#create_workout", as: "create_workout"
  # patch '/users/:id/edit_workout', to: "users#edit_workout", as: "edit_workout"

  # post '/signup', to: "sessions#create"
  # get '/signup', to: "users#new"
  # get '/logout', to: "sessions#destroy"
  get '/', to: "sessions#new"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  get '/signup', to: "users#new"
end
