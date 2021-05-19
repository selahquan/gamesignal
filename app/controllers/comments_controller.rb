class CommentsController < ApplicationController
    include ReviewsHelper

    before_action :redirect_if_not_logged_in

    def new
        @user = User.new
    end
    
    def create
        @comment = current_user.comments.build(comment_params)
        @comment.review_id = params[:review_id]
        @comment.save
        redirect_to review_path(@comment.review)
    end

    def destroy
        @comment.destroy
        redirect_to review_path(@comment.review)
    end
    
    private
    
    def user_params
        params.require(:user).permit(:content)
    end
end
