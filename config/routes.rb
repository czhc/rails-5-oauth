Rails.application.routes.draw do
  use_doorkeeper

  resources :users
  namespace :api do
    namespace :v1 do
      resources :users do
        collection do
          get :sync, to: 'users#sync'
        end
      end
    end
  end
end
