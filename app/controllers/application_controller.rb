class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
      configure do
      enable :sessions
      set :session_secret, 'my_secret_key'
      set :session_expire_after, 3600
    end
  
    # Add your routes here

    # CARS!!!!
    get "/" do
      # get all cars in array format
    cars = Car.all
    cars.to_json()
    end

    # get single car
    get "/car/:id" do
      # id: in database
      # pk: in url
      car = Car.find_by(id: params[:id])
      car.to_json()
    end

    # post a car(create new instances)
    post "/car/" do
      car = Car.create(
        image_url: params[:image_url],
        model: params[:model],
        speed: params[:speed],
        datetime: params[:datetime]
      ) 
      car.save()
      {
        "Message": "Created successfully",
        "Status": "HTTP_200_OK"
      }.to_json()
    end

    # Patch a car
    patch "/car/update/:id" do
      car = Car.find_by(id: params[:id])

      car.update(
        image_url: params[:image_url],
        model: params[:model],
        speed: params[:speed],
        datetime: params[:datetime]      
      )

      car.to_json()
    end

    # delete a car
    delete "/car/:id" do
      car = Car.find_by(id: params[:id])  
      car.destroy
      {
        "message":"Successfuly deleted Car",
        "Status":"HTTP_200_OK"
      }.to_json()
    end   
    
    

    # USERS!!!!!

    # get all users
    get "/users/" do
    users = User.all
    users.to_json()
    end

    # get user reviews by ID
    get '/users/:id/reviews/:review_id.json' do
      user = User.find(params[:id])
      review = user.reviews.find(params[:review_id])
      review.to_json
    end

    # get all user reviews
    get '/users/:id/reviews' do
      @user_reviews = Review.where(user_id: params[:id])
      @user_reviews.to_json
    end

    # save/POST a User
    post "/user/" do
      registered_user = User.find_by(phonenumber: params[:phonenumber])
      # verify if user exists
      if registered_user
        return {"error":"User already exists!"}.to_json()
      end
      # create user 
      user = User.create(
        fullname: params[:fullname],
        phonenumber: params[:phonenumber],
        idnumber: params[:idnumber],
        address: params[:address],
      )
      user.save
      {
        "message":"User successfully created",
        "status":"HTTP_200_user_created"
      }.to_json()
    end
       


    # REVIEWS!!!!
    # get all reviews
    get "/reviews/" do
      reviews = Review.all
      reviews.to_json()
    end  

    # get all car users reviews
    get '/car/:id/users' do
      # get the specific car
      car = Car.find_by(id: params[:id])
      car.reviews.find_all do |review|
         review.user_id
      end.to_json(only: [:id], include: {user: {only: [:id, :fullname, :phonenumber, :idnumber, :address]}})
    end


    
    # HIRES!!!!!

    # get all hires
    get "/hires/" do
      hires = Hire.all
      hires.to_json()
    end

    # record hirings
    post "/car/hire/" do
      car = Car.find_by(id: params[:car_id])
      registered_user = User.find_by(phonenumber: params[:phonenumber])

      # create hire instance
      if registered_user
        hire = Hire.create(
          user_id: registered_user.id,
          car_id: car.id,
          loan_date: params[:loan_date],
          return_date: params[:return_date],
          payment: params[:payment]
        )
        hire.save
        {
          "message":"Car hired successfully for user #{registered_user.fullname}",
          "status":"201_created"
        }.to_json()
      else
        {
          "error":"User not found",
          "status":"404_not_found"
        }.to_json()
    end
  end




    # user authentication
    # users
    # t.string :fullname
    # t.string :phonenumber
    # t.string :idnumber
    # t.string :address
    # t.timestamps
    

    # admin

    # user authentication
    # Sign up route
     post '/signup' do
      user = User.new(
        fullname: params[:fullname],
        username: params[:username],
        phonenumber: params[:phonenumber],
        idnumber: params[:idnumber],
        address: params[:address],
        password: params[:password]
      )
    
      if user.save
        session[:user_id] = user.id
        status 200
      else
        flash[:error] = user.errors.full_messages.join(', ')
        status 400
      end
    end
    
    # user login
    post '/login' do
      user = User.find_by(username: params[:username])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        content_type :json
        { message: "Successfully logged in" }.to_json
      else
        status 401
        body "Invalid email or password"
      end
    end
end

