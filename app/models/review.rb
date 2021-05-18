class Review < ApplicationRecord
    belongs_to :user
    belongs_to :game
    has_many :comments
    accepts_nested_attributes_for :games
end
