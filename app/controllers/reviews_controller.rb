class ReviewsController < ApplicationController
	include ReviewsHelper

	before_action :redirect_if_not_logged_in
	before_action :find_and_set_review, only: [:show, :edit, :update, :destroy]
	before_action :can_change?, only: [:edit, :update, :destroy]

    def index
        @reviews = Review.all
    end

    def show
        @review = Review.find_by_id(params[:id])
    end

    def new
		if user_reviewed_game_already?(@game)
			flash[:message] = "You have already reviewed this game."
			redirect_to game_path(@game.id)
		end
		@review = @game.reviews.build
	end

    def create
		@review = Review.create(review_params)
		redirect_to review_path(@review.id)
	end

	def edit
		@review = Review.find(params[:id])
		
	end

	def update
		review = Review.find(params[:id])
		review.update(post_params)
		redirect_to review_path(review)
	end

	def destroy
		@review.destroy
		redirect_to reviews_path
	end

	private

	def post_params
		params.require(:review).permit(:title, :content, :game)
	end

	def can_change?
		if !(@review.user == current_user)
			redirect_to reviews_path, alert: "You can't change a review you did not write"
		end
	end

	def find_and_set_review
		@review = Review.find_by(id: params[:id])
	end
end
