Rails.application.routes.draw do

  root "pages#home"

  resources :users, only: [:show, :edit, :update]
  resources :posts, only: [:index, :show, :new, :create, :destroy] do
    resources :comments, only: [:create]
  end
  resources :comments, only: [:destroy]
  resources :likes, only: [:destroy]

  resources :jobs, only: [:index, :show, :new, :edit, :create, :destroy] do
    resources :job_applications, only: [:index, :show, :new, :edit, :create]
  end
  resources :job_applications, only: [:destroy, :update]

  resources :likes, only: %i[create destroy]
  resources :feed
  get "signup", to: "users#new"
  post "signup", to: "users#create"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  post "logout", to: "sessions#destroy"
  get "logout", to: "sessions#destroy"

  # api to fetch nonces for users
  namespace :api do
    namespace :v1 do
      resources :users
    end
  end
end
