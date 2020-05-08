Rails.application.routes.draw do
  root 'items#index'
  
  #購入機能実装時にitemsに対してネスト設定を行う（item_id情報を受け取るため）
  resources :purchases, only: [:index]

end
