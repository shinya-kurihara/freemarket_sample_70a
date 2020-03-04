Rails.application.routes.draw do
  get 'mains/index'
  root "mains#index"
end
