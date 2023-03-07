class Owner < ActiveRecord::Base
    has_many :cars
    # admin authentication
    # details:email, password: add to owners migration
    has_secure_password
end