class User < ActiveRecord::Base
    
    has_many :reviews
    has_many :cars, through: :reviews
    has_secure_password
end