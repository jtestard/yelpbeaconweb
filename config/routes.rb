Rails.application.routes.draw do
  root to: 'businesses#index'
  
  #post '/behaviors/create' => 'behaviors#create', :as => :create_behavior
  #post '/beacons/create' => 'beacons#create', :as => :create_beacon
  #post '/beacons/destroy' => 'beacons#destroy', :as => :destroy_beacon
  
  resources :beacons #, :defaults => { :format => 'json' }
  resources :behaviors
  resources :businesses
  resources :sessions
  
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "businesses#new", :as => "sign_up"
  
end
