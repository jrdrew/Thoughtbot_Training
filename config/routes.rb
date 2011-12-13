Faceroll::Application.routes.draw do
  root to: "welcome#index"  
  resource :dashboard, only: [:show]
  resource :search, only: [:show]
  resources :posts, only: [:create]
  resources :photos, only: [:create]
  
  resources :users, only: [:show] do
    resources :friendships, only: [:create]

  end
end
