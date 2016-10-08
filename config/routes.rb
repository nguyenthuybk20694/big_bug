Rails.application.routes.draw do
  
  resources :reviews
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  devise_for :users
  root "static_pages#home"
  get '/profile', to: 'static_pages#profile'
end
