Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })
  get("/directors", { :controller => "directors", :action => "index" })
  post("/create_director", {:controller => "directors", :action => "create"})
  get("/directors/youngest", { :controller => "directors", :action => "max_dob" })
  get("/directors/eldest", { :controller => "directors", :action => "min_dob" })
  get("/directors/:director_id", { :controller => "directors", :action => "show" })
  
  post("/update_director/:director_id", {:controller => "directors", :action => "update"})
  get("/delete_director/:director_id", {:controller => "directors", :action => "delete"})

  get("/movies", { :controller => "movies", :action => "index" })
  get("/movies/:path_id", { :controller => "movies", :action => "show" })
  
  get("/actors", { :controller => "actors", :action => "index" })
  post("/create_actor", { :controller => "actors", :action => "create" })
  get("/actors/:actor_id", { :controller => "actors", :action => "show" })
  post("/update_actor/:actor_id", {:controller => "actors", :action => "update"})
  get("/delete_actor/:actor_id", {:controller => "actors", :action => "delete"})
end
