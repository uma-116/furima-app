Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }

  devise_scope :user do
    get  'addresses', to: 'users/registrations#address_registration'
    post 'addresses', to: 'users/registrations#create_address'
  end

  root 'items#index'

  resources :items, only: [:new, :create]

  resources :item_details, only: [:show, :edit, :update, :destroy]

  #購入機能実装時にitemsに対してネスト設定を行う（item_id情報を受け取るため）
  resources :purchases, only: [:index]

  resources :credit_cards, only: [:new, :show] do
    collection do
      post 'pay', to: 'credit_cards#pay'
    end
  end
  resources :users, only: [:show]

end
