Rails.application.routes.draw do
  use_doorkeeper
  resources :users
  namespace :api do
    namespace :v1 do
      resources :users
    end
  end
end
