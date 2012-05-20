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
    get :autocomplete_project_status, :on => :collection
    get :autocomplete_role_title, :on => :collection
    get :autocomplete_user_fullname, :on => :collection
  end
  
  # root route
  get "home/index"
  root :to => "Home#index"
end
