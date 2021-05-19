class Game < ApplicationRecord
    has_many :reviews
    has_many :users
    has_many :groups, through: :users
    
end
