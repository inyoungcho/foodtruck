Foodtruck::Application.routes.draw do

  root to: 'ember#index'
  
  resources :slots, only: :index do
    get 'available_filters', on: :collection
  end

  resources :trucks, only: :show

end
