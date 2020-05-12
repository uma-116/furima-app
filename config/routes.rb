Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }

  devise_scope :user do
    get  'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  root 'items#index'
  resources :item_details, only: [:index, :edit, :update, :destroy]

  #購入機能実装時にitemsに対してネスト設定を行う（item_id情報を受け取るため）
  resources :purchases, only: [:index]

  resources :users, only: [:show] 
  
   
end
