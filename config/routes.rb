Rails.application.routes.draw do
  devise_for :users
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'daily', to: 'pages#daily'
      resources :hitlists, only: [:index]
      resources :clubs do
        scope module: :clubs do
          resources :club_requests, only: [:create]
          resources :contacts, only: [:create]
        end
      end
      resources :club_requests, only: [:index, :show, :update, :destroy]
      resources :contacts, only: [:index, :show, :update, :destroy]
      resources :players do
        resources :comments
        resources :contracts
        resources :evaluations
      end
      resources :sessions, only: [:create, :destroy]
      resources :users, only: [:create]
    end 
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
