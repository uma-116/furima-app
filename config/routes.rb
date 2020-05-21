Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }

  devise_scope :user do
    get  'addresses', to: 'users/registrations#address_registration'
    post 'addresses', to: 'users/registrations#create_address'
  end

  root 'items#index'

  resources :items do

    resources :purchases, only: [:index] do
      collection do
        post 'pay', to: 'purchases#pay'
      end
    end
  

    resources :comments, only: :create
  end

    resources :credit_cards, only: [:new, :show, :destroy] do
      collection do
        post 'pay', to: 'credit_cards#pay'
      end
    end

  get "category/set_parents", to: "items#set_parents"
  get "category/set_children", to: "items#set_children"
  get "category/set_grandchildren", to: "items#set_grandchildren"


  resources :users, only: [:show] do
    collection do
      get "log_in"
      get "new_user"
    end
  end
end

