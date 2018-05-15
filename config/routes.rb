Rails.application.routes.draw do



  root "static_pages#root"


  namespace :api, defaults: { format: :json } do
    resources :users, only: [:update, :show, :create, :index]

    resources :profiles, only: [:show, :update]
    resource :session, only: [:create, :destroy]
    resources :posts, only: [:create, :index, :update, :destroy]
    resources :comments, only: [:create, :index, :update, :destroy]

    post "users/:id/friendships", to: "users#create_friendship"
    patch "users/:id/friendships", to: "users#update_friendship"
    delete "users/:id/friendships", to: "users#destroy_friendship"

  end



end
