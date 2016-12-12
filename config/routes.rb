Rails.application.routes.draw do
  root to: 'home#show'
  resources :projects, only: [:new, :create, :index, :show] do
    resources :votes, only: [:new, :create]
  end



  namespace :admin do
    get '/dashboard', to: 'dashboard#show'
    resources :demo_nights, only: [:show, :new, :create, :index, :update]
    resources :projects, only: [:index, :edit]
  end

  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  get "/auth/:provider/callback", to: "sessions#create"
end
