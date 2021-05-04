class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :review

    validates_presence_of :content
end
