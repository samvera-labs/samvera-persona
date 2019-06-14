Rails.application.routes.draw do
  scope module: :samvera do
    namespace :persona do
      resources :users do
        post :impersonate, on: :member
        post :stop_impersonating, on: :collection
      end
    end
  end
end
