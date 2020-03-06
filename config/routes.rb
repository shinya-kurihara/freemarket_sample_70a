Rails.application.routes.draw do
  get 'mains/index'
  root "mypages#index"
end
