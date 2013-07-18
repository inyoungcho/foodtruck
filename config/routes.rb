Foodtruck::Application.routes.draw do

  root to: 'application#index'
  
  resources :slots
  resources :trucks

end
