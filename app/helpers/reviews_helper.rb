module ReviewsHelper

    def user_reviewed_game_already?(game)
        !current_user.reviews.where(reviewed_game: game).empty?
    end
end
