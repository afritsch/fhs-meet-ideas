FhsMeetIdeas::Application.routes.draw do
  # static pages
  get "pages/imprint"
  
  # resources
  resources :projects, :only => [:index, :show, :new, :create, :edit, :update, :destroy]
  resource :user_sessions, :only => [:new, :create, :destroy]
  
  match "login" => "user_sessions#new", :as => "login"
  match "logout" => "user_sessions#destroy"
  
  # root route
  get "home/index"
  root :to => "Home#index"
end
