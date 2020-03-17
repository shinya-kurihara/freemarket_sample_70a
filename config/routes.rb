Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'sending_destinations', to: 'users/registrations#new_sending_destination'
    post 'sending_destinations', to: 'users/registrations#create_sending_destination'
  end
  
  resources :exhibition, only: :index
  resources :items, only: [:index, :show]
  resources :buy, only: :index

  root "items#index"
  resources :credit_cards
  resources :mypages do
    collection do
      get :logout
    end
  end
end
