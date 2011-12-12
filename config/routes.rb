Faceroll::Application.routes.draw do
  root to: "welcome#index"  
  resource :dashboard, only: [:show]
  resources :posts, only: [:create]
  resources :photos, only: [:create]
end
