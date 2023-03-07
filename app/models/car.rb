class Car < ActiveRecord::Base
    has_many :reviews
    belongs_to :owner
end