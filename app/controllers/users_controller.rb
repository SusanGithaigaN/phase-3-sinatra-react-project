class UsersController < ApplicationController    
    # Login route
   
  
    # Logout route
    delete '/logout' do
      session[:user_id] = nil
      redirect '/'
    end
  end
  