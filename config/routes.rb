Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
    resources :items

    # resources :items, only: [:new, :create, :show, :edit, :update, :destroy] do
    # end
end
