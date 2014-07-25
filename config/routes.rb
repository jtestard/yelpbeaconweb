Rails.application.routes.draw do
  root to: 'visitors#index'
  
  resources :beacons, :defaults => { :format => 'json' }
  
end
