Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  get 'mains/index'
  root "mains#index"
end
