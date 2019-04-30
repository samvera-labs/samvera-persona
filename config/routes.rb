Rails.application.routes.draw do
  get 'test/index'
  
  scope module: :hyrax do
    namespace :admin do
      resources :users, only: [:index]
    end
  end
  
end
