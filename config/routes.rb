Rails.application.routes.draw do
  devise_for :users
  ActiveAdmin.routes(self)

  root "pages#home"

  resources :users, only: [:show, :edit, :update]
  resources :posts, only: [:index, :show, :new, :create, :destroy] do
    resources :comments, only: [:create]
  end
  resources :comments, only: [:destroy]
  resources :likes, only: [:destroy]

  resources :jobs, only: [:index, :show, :new, :edit, :create, :destroy] do
    get "jobs/:id", action: :index, on: :collection
    resources :job_applications, only: [:index, :show, :new, :edit, :create]
  end
  resources :job_applications, only: [:destroy, :update]

  resources :myjobs, only: [:index]
  resources :myapplications, only: [:index]
  resources :conversations, only: [:index, :create, :show] do
    post 'create_message', on: :member
  end

end
