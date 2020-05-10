Rails.application.routes.draw do
  root 'items#index'
  resources :item_details, only: [:index, :edit, :update, :destroy]
end
