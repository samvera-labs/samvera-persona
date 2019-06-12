Rails.application.routes.draw do
  get 'test/index'
  
  scope module: :hyrax do
    namespace :admin do
      resources :users do
        post :impersonate, on: :member
        post :stop_impersonating, on: :collection
      end
    end
  end
  
end
