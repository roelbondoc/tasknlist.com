ActionController::Routing::Routes.draw do |map|
  map.resources :lists
  map.resources :tasks
  map.root :controller => 'lists', :action => 'index'
  map.connect '/:permalink', :controller => 'lists', :action => 'show'
end
