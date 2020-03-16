Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'sending_destinations', to: 'users/registrations#new_sending_destination'
    post 'sending_destinations', to: 'users/registrations#create_sending_destination'
  end
  get 'mypages/index'
  get 'products/index'
  root 'mains#index'
  get 'buy/index'
  # resources :credit_cards, only: [:new, :show, :create] do
  #   collection do
  #     post 'delete', to: 'credit_cards#delete'
  #   end
  # end
  resources :credit_cards, only: [:new, :show] do
    collection do
      post :pay
      post :delete
      post :show
      # post 'show', to: 'credit_cards#show'
      # post 'pay', to: 'credit_cards#pay'
      # post 'delete', to: 'credit_cards#delete'
    end
  end
end
