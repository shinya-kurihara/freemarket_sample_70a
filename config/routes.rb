Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'sending_destinations', to: 'users/registrations#new_sending_destination'
    post 'sending_destinations', to: 'users/registrations#create_sending_destination'
  end
<<<<<<< HEAD
  get 'mypages/index'
  root 'mains#index'

  resources :mains, only: :show do
    resources :buy, only: :index do
      collection do
        post 'pay', to: 'buy#pay'
        get 'done', to: 'buy#done'
      end
    end
  end

  resources :credit_cards, only: [:new, :show] do
    collection do
      post 'show', to: 'credit_cards#show'
      post 'pay', to: 'credit_cards#pay'
      post 'delete', to: 'credit_cards#delete'
=======
  
  resources :exhibition, only: :index
  resources :items, only: [:index, :show]
  resources :buy, only: :index

  root "items#index"
  resources :credit_cards
  resources :mypages do
    collection do
      get :logout
>>>>>>> master
    end
  end
end
