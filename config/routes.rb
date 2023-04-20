Rails.application.routes.draw do

  root to: "homes#top"

  resources :items
  resources :tags
  resources :item_tags,  only: [:index, :create, :destroy]

  #タグで検索
  get "search_tag" => "items#search_tag"

end
