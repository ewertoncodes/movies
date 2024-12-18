Rails.application.routes.draw do
  resources :movies do
    post "add_comment", on: :member
  end

  root "omdb#search"
  get "omdb/search", to: "omdb#search", as: "omdb_search"
  get "omdb/show/:id", to: "omdb#show", as: "omdb_show"
end
