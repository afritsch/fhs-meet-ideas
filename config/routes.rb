FhsMeetIdeas::Application.routes.draw do
  resource :user_sessions
  
  match "logout" => "user_sessions#destroy"
  match "login" => "user_sessions#new", :as => "login"

  # static pages
  get "pages/imprint"
  
  # resources
  resources :projects, :only => [:index, :show, :new, :create, :edit, :update, :destroy]
  
  # root route
  get "home/index"
  root :to => "Home#index"
end
