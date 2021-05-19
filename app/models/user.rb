class User < ApplicationRecord
    has_many :games, through: :reviews
    has_many :reviews
    belongs_to :group

    has_secure_password

    validates_uniqueness_of :email, :username
    validates_presence_of :username, :email
end
