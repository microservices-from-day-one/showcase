Rails.application.routes.draw do
  root 'home#index'

  resource :cart, only: :show do
    member do
      post 'add_item'
      delete 'remove_item'
    end
  end
  resources :categories, only: :show
  resource :contact, only: [:show, :create]
  resources :books, only: :show
end
