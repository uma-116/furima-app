Rails.application.routes.draw do
  root 'items#index'

  resources :items, only: [:new, :create]

  resources :item_details, only: [:index, :edit, :update, :destroy]

  #購入機能実装時にitemsに対してネスト設定を行う（item_id情報を受け取るため）
  resources :purchases, only: [:index]

  resources :credit_cards, only: [:new, :show] do
    collection do
      post 'pay', to: 'credit_cards#pay'
    end
  end
  resources :users, only: [:show] do

    collection do
      get "log_in"
      get "new_user"
    end
  end   
end
