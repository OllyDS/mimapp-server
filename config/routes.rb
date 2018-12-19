Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      #resources
      resources :users
      resources :locations
      
      #login checks
      post 'login', to: 'users#login'
      get 'validate', to: 'users#validate'
    end
  end
end
