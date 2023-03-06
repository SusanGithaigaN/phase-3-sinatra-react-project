class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    # get all cars in array format
   cars = Car.all
  #  p cars
   cars.to_json()
  end

    # get single car
    get "/car/:pk" do
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

  # save a User
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

  # record hirings
  post "/car/hire/" do
    car = Car.find_by(id: params[:car_id])
    registered_user = User.find_by(phonenumber: params[:phonenumber])

    # create hire instance
    if registered_user
      hire = Hire.create(
        user_id: registered_user.id,
        car_id: car.id
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

  # get all car users
  get '/car/:id/users' do
    # get the specific car
    car = Car.find_by(id: params[:id])
    car.reviews.find_all do |review|
      review.user_id
    end.to_json(only: [:id], include: {user: {only: [:id, :fullname, :phonenumber, :idnumber, :address]}})
  end

    # # get all car reviews
    # get '/car/:id/reviews' do
    #   # get the specific car
    #   car = Car.find_by(id: params[:id])
    #   car.users.find_all do |user|
    #     user.user_id
    #   end.to_json(only: [:id], include: {user: {only: [:id, :review, :user_id, :car_id, :owner_id]}})
    # end

end

