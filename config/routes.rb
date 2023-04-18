Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :dishes, only: [:show]
  resources :chefs, only: [:show]
  resources :ingredient_dishes, only: [:create]

  get "chefs/:id/ingredients", to: "chefs/ingredients#index"
end
