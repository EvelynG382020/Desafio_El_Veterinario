Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'pages/index'
  root 'pages#index'

  resources :pet_histories
  resources :pets 
  resources :clients

end
