Rails.application.routes.draw do
  get 'products/show'
  get 'mains/index'
  root "mains#index"
end
