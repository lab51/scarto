Rails.application.routes.draw do
  
  root 'application#index'
  
  get 'sessions/destroy'
  get 'o-stronie' => 'application#about'  
  get 'user/login' => 'sessions#new'
  get 'user/logout' => 'sessions#destroy'

  resources :ads
  resources :sessions 
  resources :users
  resources :brands 
  resources :types
  resources :ad_images
  get ':brand_name', to: 'brands#show', as: :brand_name
  get 'ogloszenie/dodaj' => 'ads#new'
  get 'ogloszenie/:id' => 'ads#show'
  
  match ":brand_name/:model_name", to: 'types#show', via: 'get'
  
end
