Rails.application.routes.draw do
  get 'pages/home'
  get 'dashboard/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # get "/", :controller => "tacos", :action => "index"

resources "providers"
resources "wrvu"
resources "cmi"
resources "quality"
resources "sessions"

  # Login/logout
  get("/login", { :controller => "sessions", :action => "new" })
  get("/logout", { :controller => "sessions", :action => "destroy" })

  # Define the root route
  root 'pages#home'

  #Define the landing page
  get '/dashboard', to: 'dashboard#show'

end
