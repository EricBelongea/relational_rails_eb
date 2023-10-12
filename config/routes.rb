Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/parents", to: "fields#index"
  get "/parents/:id", to: "fields#show"


end
