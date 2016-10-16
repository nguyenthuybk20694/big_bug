Rails.application.routes.draw do
  namespace :admin do
    resources :reviews
  end
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  namespace :admin do
    resources :reviews
    resources :users
  end
  resources :reviews do
    member do
      get 'like', to: "reviews#like"
      get 'unlike', to: "reviews#unlike"
    end
    resources :comments
  end
  
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  root "static_pages#home"
  get '/profile', to: 'static_pages#profile'
  get '/manager_reviews', to: 'static_pages#manager_reviews'
end
