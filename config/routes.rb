Rails.application.routes.draw do

  get 'sign_in', to: 'sessions#new', as: :sign_in
  get '/auth/:provider/callback', to: 'sessions#create'

  resources :thumbs_ups, only: [:new, :create]

  root 'pages#index'

end
