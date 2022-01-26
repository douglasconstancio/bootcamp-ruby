Rails.application.routes.draw do
  resources :images
  devise_for :users
  root 'home#index', as: :home
end
