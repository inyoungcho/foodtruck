Foodtruck::Application.routes.draw do

  root to: 'slots#index'
  
  resources :slots
  resources :trucks

end
