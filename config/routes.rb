Rails.application.routes.draw do

  get 'sign_in', to: 'sessions#new', as: :sign_in
  get '/auth/:provider/callback', to: 'sessions#create'
  delete 'sign_out', to: 'sessions#destroy', as: :sign_out

  resources :thumbs_ups, only: [:new, :create]

  root 'pages#index'

end
