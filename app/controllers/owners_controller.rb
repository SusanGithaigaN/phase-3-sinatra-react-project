class OwnersController < ApplicationController
    # Sign up route
    post '/owners/signup' do
      owner = Owner.new(params[:owner])
      if owner.save
        session[:owner_id] = owner.id
        redirect '/owners/login'
      else
        flash[:error] = owner.errors.full_messages.join(', ')
        redirect '/owners/signup'
      end
    end
  
    # Login route
    post '/owners/login' do
      owner = Owner.find_by(email: params[:email])
      if owner && owner.authenticate(params[:password])
        session[:owner_id] = owner.id
        redirect '/cars'
      else
        flash[:error] = 'Invalid email or password'
        redirect '/owners/login'
      end
    end
  
    # Logout route
    delete '/owners/logout' do
      session[:owner_id] = nil
      redirect '/'
    end
  end
  