Rails.application.routes.draw do
  devise_for :users
  # Home page
  root to: 'pages#home'
  # Search page
  get 'search', to: 'pages#search'
  resources :offers do
    resources :bookings, except: %i[show destroy index]
  end
  resources :bookings, only: %i[show destroy index]
end
