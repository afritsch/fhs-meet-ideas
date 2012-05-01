FhsMeetIdeas::Application.routes.draw do
  # static pages
  get "pages/imprint"
  
  # root route
  get "home/index"
  root :to => "Home#index"
end
