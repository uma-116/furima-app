Rails.application.routes.draw do
  root 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :users, only: [:show] do

    collection do
      get "log_in"
      get "new_user"
    end
  end 
end
