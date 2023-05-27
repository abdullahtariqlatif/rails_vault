Rails.application.routes.draw do
  root "articles#index"

  # View all of the Article Records
  get 'articles/index'

  # View a particular Article Record
  get "/articles/:id", to: "articles#show"

  # Create a new Article
  get "/articles/new", to: "articles#new"
  post "/articles", to: "articles#create"

  # Edit an existing Article
  get "/articles/:id/edit", to: "articles#edit"
  patch "/articles/:id", to: "articles#update"

  # Delete an existing Article
  delete "/articles/:id", to: "articles#destroy"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
