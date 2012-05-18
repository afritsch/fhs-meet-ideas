FhsMeetIdeas::Application.routes.draw do
  # static pages
  get "pages/imprint"
  
  # resources
  #resources :projects, :only => [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :projects do
    resources :comments
  end
  resource :user_sessions, :only => [:new, :create, :destroy]
  
  # user authentication
  match "login" => "user_sessions#new"
  match "logout" => "user_sessions#destroy"
  
  # root route
  get "home/index"
  root :to => "Home#index"
end
