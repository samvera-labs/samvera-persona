Rails.application.routes.draw do
  get 'test/index'
  
  namespace:admin do
    resources :users, only: [:index]
  end
  
end
