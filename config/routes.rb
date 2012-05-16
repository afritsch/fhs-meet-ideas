FhsMeetIdeas::Application.routes.draw do
  get "persons/create"
  get "persons/destroy"
  
  
  match "/auth/:provider/callback" => "persons#create"
  match "/signout" => "persons#destroy", :as => :signout

  # static pages
  get "pages/imprint"
  
  # resources
  resources :projects, :only => [:index, :show, :new, :create, :edit, :update, :destroy]
  
  # root route
  get "home/index"
  root :to => "Home#index"
end
