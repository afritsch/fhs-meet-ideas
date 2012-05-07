FhsMeetIdeas::Application.routes.draw do
  resources :projects, :only => [:index]

  # static pages
  get "pages/imprint"
  
  # root route
  get "home/index"
  root :to => "Home#index"
end
