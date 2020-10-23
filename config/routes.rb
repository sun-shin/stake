Rails.application.routes.draw do
  namespace :api do
    get "/users/:id" => "users#show"
    post "/users" => "users#create"
    patch "/users/:id" => "users#edit"
    delete "/users/:id" => "users#destroy"
    
    post "/sessions" => "sessions#create"
  end
end
