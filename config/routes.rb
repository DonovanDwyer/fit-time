Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :workouts
  resources :workout_joins, only: [:new, :create, :destroy]
  resources :exercises

  get '/users/:id/create_workout/new', to: "users#new_workout", as: "create_new_workout"
  post '/users/:id/create_workout', to: "users#create_workout", as: "create_workout"

  get '/', to: "sessions#create"
end
