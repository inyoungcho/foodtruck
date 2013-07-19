Foodtruck::Application.routes.draw do

  root to: 'ember#index'
  
  resources :slots
  resources :trucks

end
