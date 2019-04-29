Rails.application.routes.draw do
  get 'test/index'

  resources :admin_users, only: [:index]
end
