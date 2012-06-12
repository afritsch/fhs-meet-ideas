FhsMeetIdeas::Application.routes.draw do
  # user authentication
  resource :user_sessions, :only => [:new, :create, :destroy], :constraints => { :protocol => "https" }
  resource :user_sessions, :only => [:new, :create, :destroy] if Rails.env != "production"
  match "login" => "user_sessions#new"
  match "logout" => "user_sessions#destroy"

  # projects
  resources :projects do
    resources :comments, :only => [:create]
    get :autocomplete_project_status, :on => :collection
    get :autocomplete_role_title, :on => :collection
    get :autocomplete_user_fullname, :on => :collection
  end

  #user
  resources :users, :only => [:index, :show]

  # static pages
  get "pages/imprint"

  # root route
  get "home/index"
  root :to => "Home#index"
end
