class Group < ApplicationRecord
    has_many :users
    has_many :games, through: :users 
end
