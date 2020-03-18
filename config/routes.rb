Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'sending_destinations', to: 'users/registrations#new_sending_destination'
    post 'sending_destinations', to: 'users/registrations#create_sending_destination'
  end
  resources :mypages, only: :index
  resources :items, only: [:index, :new, :create]
  resources :products, only: :index
  resources :buy, only: :index
  root "items#index"
end