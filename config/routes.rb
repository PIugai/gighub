Rails.application.routes.draw do
  root to: 'pages#home'
  post '/login', to: 'login#login'
  # root to: 'pages#home'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [:show, :new, :create]
      resources :bands, only: [:index, :show, :new, :create]
      resources :bookings, only: [:new, :create]
      get '/tagged', to: "bands#tagged", as: :tagged
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
