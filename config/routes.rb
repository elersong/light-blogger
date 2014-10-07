Rails.application.routes.draw do
  
  root to: 'articles#index'
  
  # this will create the seven RESTful resource actions (induces) for the articles table
  resources :articles do
    resources :comments
  end
  
end
