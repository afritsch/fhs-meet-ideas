FhsMeetIdeas::Application.routes.draw do
  # user authentication
  resource :user_sessions, :only => [:new, :create, :destroy]
  match "login" => "user_sessions#new"
  match "logout" => "user_sessions#destroy"

  # undo actions
  post "versions/:id/revert" => "versions#revert", :as => "revert_version"

  # projects
  resources :projects do
    resources :comments, :only => [:create]
    get :autocomplete_user_fullname, :on => :collection
  end

  #user
  resources :users, :only => [:index, :show]

  #followups
  resources :followups, :only => [:create, :destroy]

  #contact form
  get "contact" => "contact_form#new"
  post "contact" => "contact_form#create"

  # imprint page
  get "pages/imprint"

  # root route
  get "home/index"
  root :to => "Home#index"
end
