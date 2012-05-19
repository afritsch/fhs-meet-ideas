FhsMeetIdeas::Application.routes.draw do
  # static pages
  get "pages/imprint"
  
  # user authentication
  resource :user_sessions, :only => [:new, :create, :destroy]
  match "login" => "user_sessions#new"
  match "logout" => "user_sessions#destroy"
  
  # projects
  resources :projects, :only => [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :comments, :only => [:create]
  end
  
  # root route
  get "home/index"
  root :to => "Home#index"
end
