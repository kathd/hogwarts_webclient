Rails.application.routes.draw do
  
  namespace :api do
    
    namespace :v1 do
      get "/students" => "students#index"  
      get "/students/new" => "students#new"
      post "/students" => "students#create"
      get "/students/:id" => "students#show"      
      get "/students/:id/edit" => "students#edit"
      patch "/students/:id" => "students#update"   
      delete "/students/:id" => "students#destroy"
    end
  
  end

end
