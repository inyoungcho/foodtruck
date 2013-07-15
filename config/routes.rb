Foodtruck::Application.routes.draw do
  resources :slots

  root to: 'trucks#index'
  
  resources :trucks

end
