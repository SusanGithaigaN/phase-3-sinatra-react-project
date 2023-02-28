class Hackathon < ActiveRecord::Base
    # one hackathon has many events
    has_many :events
    # how to know how many users have registered for the event
    has_many :users through: :events
end