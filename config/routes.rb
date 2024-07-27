Rails.application.routes.draw do
  devise_for :users
   root to: "items#index"
   resources :items, only: [:index, :new, :create, :edit, :show, :update]
   resources :order, only: [:index, :show, :edit, :create] 
end