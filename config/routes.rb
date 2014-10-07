Rails.application.routes.draw do
  
  # this will create the seven RESTful resource actions (induces) for the articles table
  resources :articles
  
end
