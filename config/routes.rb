Rails.application.routes.draw do
  devise_for :users
  root to: "static_pages#index"
  resources :hospitals
  resources :hospitals do
    resources :bookings, only: [:new, :create] 
  end
  resources :bookings, only: [:show, :edit, :create, :destroy, :update]
  get '/my_bookings', to: 'static_pages#show'
end
