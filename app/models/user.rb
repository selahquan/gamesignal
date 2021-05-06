class User < ApplicationRecord
    has_many :games
    has_many :reviews
    belongs_to :group

    has_secure_password
end
