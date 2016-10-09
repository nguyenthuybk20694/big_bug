Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :reviews do
    member do
      get 'like', to: "reviews#like"
      get 'unlike', to: "reviews#unlike"
    end
  end
  
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  root "static_pages#home"
  get '/profile', to: 'static_pages#profile'
end
