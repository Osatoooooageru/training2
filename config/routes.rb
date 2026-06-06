Rails.application.routes.draw do
  resources :posts
  resources :tweets
  devise_for :users
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root "tweets#index"

resources :tweets do
    resources :likes, only: [:create, :destroy]
end

resources :menus
end
