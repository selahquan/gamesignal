class ReviewsController < ApplicationController
    def index
        @reviews = Review.all
    end

    def show
        @review = Review.find(params[:id])
    end

    def new
		@review = Review.new
		#@categories = Category.all
	end

    def create
		post = Post.create(post_params)
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
