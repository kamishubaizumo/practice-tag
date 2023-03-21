Rails.application.routes.draw do


  root to: "homes#top"

  resources :items
  resources :tags, only: [:index, :edit, :update, :create, :destroy]
  resources :item_tags,  only: [:index, :create, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
