Rails.application.routes.draw do
  resources :comments
  devise_for :users
  root to: "blogs#index"
  resources :blogs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
