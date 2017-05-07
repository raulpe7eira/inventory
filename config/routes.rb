Rails.application.routes.draw do
  devise_for :users
  resources :materials, :except => :show
  root 'materials#index'
end
