Rails.application.routes.draw do
  root to: 'pages#home'
  post '/login', to: 'login#login'
  # root to: 'pages#home'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [:show, :new, :create] do
        resources :bands, only: [:new, :create]
        # resources :bookings, only: [:index]
      end
      resources :bands, only: [:index, :show]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
