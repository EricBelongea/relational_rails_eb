Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/fields", to: "fields#index"
  get "/fields/new", to: "fields#new"
  post "/fields", to: "fields#create"
  get "/fields/:id", to: "fields#show"

  get "/boulders", to: "boulders#index"
  get "/boulders/:id", to: "boulders#show"

  get "/fields/:id/boulders", to: "boulderfield#index"

end
