Rails.application.routes.draw do



  # Routes for the Flight resource:

  # CREATE
  post("/insert_flight", { :controller => "flights", :action => "create" })
          
  # READ
  get("/flights", { :controller => "flights", :action => "index" })
  
  get("/flights/:path_id", { :controller => "flights", :action => "show" })
  
  # UPDATE
  
  post("/modify_flight/:path_id", { :controller => "flights", :action => "update" })
  
  # DELETE
  get("/delete_flight/:path_id", { :controller => "flights", :action => "destroy" })

  #------------------------------

  # ======= Add Your Routes Above These =============
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
