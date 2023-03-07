puts "🌱 Seeding ..."

# Seed your database here

puts "🌱 Seeding cars..."
# create car instances
car1 =  Car.create(image_url: "https://bit.ly/3mgUbls", model: "TOYOTA FIELDER", speed: "120km/hr", datetime: "01/03/2023 6:22:33")
car2 =  Car.create(image_url: "https://bit.ly/41xcS4L", model: "probox", speed: "80km/hr", datetime: "01/03/2023 6:23:33")
car3 =  Car.create(image_url: "https://bit.ly/3SGLGN0", model: "MAZDA DEMIO", speed: "100km/hr", datetime: "01/03/2023 8:00:00")


puts "🌱 Seeding users ..."
# create user instance
user1 = User.create(fullname: "Nancy", phonenumber: "2345614", idnumber: "6543334", address: "14 South Wales")
user2 = User.create(fullname: "Joan", phonenumber: "04567890", idnumber: "253424312", address: "33 Kitale")
user3 = User.create(fullname: "June", phonenumber: "098732", idnumber: "25676543", address: "34 Nakuru")
user4 = User.create(fullname: "Jim", phonenumber: "092713", idnumber: "67893873", address: "354 Naru")

puts "🌱 Seeding owners..."
# create owner instance
owner1 = Owner.create(name: "Anonymous Panda", contactnumber: "5678908765", nationalid: "45678765", car_id: 1, car_model: car1.model)
owner2 = Owner.create(name: "Jenkins", contactnumber: "5678908765", nationalid: "35647892", car_id: 2, car_model: car2.model)
owner3 = Owner.create(name: "Milan", contactnumber: "5678908765", nationalid: "24567", car_id: 3, car_model: car3.model)

puts "🌱 Seeding hires..."
# create hire instance
h1 = Hire.create(
    # loan_date: Date.today, return_date: Date.today + hire_period:
    loan_date: Date.today, return_date: Date.today + 10, user_id: 1, car_id: 1, payment: "cleared",
)
h2 = Hire.create(
    loan_date: Date.today, return_date: Date.today + 14, user_id: 2, car_id: 3, payment: "Pending",
)
h3 = Hire.create(
    loan_date: Date.today, return_date: Date.today + 14, user_id: 3, car_id: 3, payment: "Cleared",
)


puts "🌱 Seeding reviews..."
# create review instance
review1 = Review.create(review: "Very fast and real comfy", user_id: 1, car_id: 1, owner_id: 1)
review2 = Review.create(review: "Not bad", user_id: 1, car_id: 1, owner_id: 1)
review3 = Review.create(review: "Nice", user_id: 3, car_id: 3, owner_id: 3)
review4 = Review.create(review: "Comfortable", user_id: 3, car_id: 2, owner_id: 3)
review5 = Review.create(review: "Too slow", user_id: 1, car_id: 2, owner_id: 1)

puts "✅ Done seeding!"
