Rails.application.routes.draw do
  namespace :api do
    get "/memes" => "memes#index"
    post "/memes" => "memes#create"
    get "/memes/:id" => "memes#show"
    patch "/memes/:id" => "memes#update"
    delete "/memes/:id" => "memes#destroy"

    post "/users" => "users#create"
    get "/users/:id" => "users#show"
    patch "/users/:id" => "users#update"
    
    post "/sessions" => "sessions#create"
    get "/logged_in" => 'sessions#is_logged_in'

    
    # delete "/users/:id" => "users#destroy"
  end
end
