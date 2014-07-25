Rails.application.routes.draw do
  root to: 'visitors#index'
  
  resources :beacons, :defaults => { :format => 'json' }
  resources :business
  resources :sessions
  
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "visitors#new", :as => "sign_up"
  
end
