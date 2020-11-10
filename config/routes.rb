Rails.application.routes.draw do
  namespace :api do
    get "/memes" => "memes#index"
    post "/memes" => "memes#create"
    get "/memes/:id" => "memes#show"
    patch "/memes/:id" => "memes#update"
    delete "/memes/:id" => "memes#destroy"


    post "/users" => "users#create"
    post "/sessions" => "sessions#create"

  end
end
