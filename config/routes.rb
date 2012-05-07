FhsMeetIdeas::Application.routes.draw do
  # static pages
  get "pages/imprint"
  
  # resources
  resources :projects
  
  # root route
  get "home/index"
  root :to => "Home#index"
end
