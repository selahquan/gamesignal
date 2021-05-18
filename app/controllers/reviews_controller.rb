class ReviewsController < ApplicationController
	include ReviewsHelper

	before_action :redirect_if_not_logged_in
  before_action :find_and_set_review, only: [:show, :edit, :update, :destroy]
  before_action :find_and_set_book, only: [:new, :create, :index]

    def index
        @reviews = Review.all
    end

    def show
        @review = Review.find(params[:id])
    end

    def new
		if user_reviewed_game_already?(@game)
			flash[:message] = "You have already reviewed this game."
			redirect_to game_path(@game.id)
		end
		@review = @game.reviews.build
	end

    def create
		review = Review.create(post_params)
		redirect_to post_path(post)
	end

	def edit
		@review = Review.find(params[:id])
		#@categories = Category.all
	end

	def update
		review = Review.find(params[:id])
		review.update(post_params)
		redirect_to review_path(review)
	end

	private

	def post_params
		params.require(:review).permit(:title, :content, :game)
	end
end
