class Event < ActiveRecord::Base
    # belongs_to: used to refer a foreign key
    belongs_to :user
    belongs_to :hackathon
end