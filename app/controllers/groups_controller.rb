class GroupsController < ApplicationController
    
	before_action :redirect_if_not_logged_in
	before_action :find_and_set_review, only: [:show, :edit, :update, :destroy]
	before_action :can_change?, only: [:edit, :update, :destroy]

	def index
        @groups = Group.all
    end

    def show
        @group = Group.find_by_id(params[:id])
    end

    def new
		
		@group = Group.new
	end

    def create
		group = Group.create(post_params)
		redirect_to group_path(group)
	end

	def edit
		@group = Group.find(params[:id])
	end

	def update
		group = Group.find(params[:id])
		group.update(group_params)
		redirect_to group_path(group)
	end

	private

	def group_params
		params.require(:group).permit(:title, :content, :game)
	end

	def find_and_set_review
		@group = Group.find_by(id: params[:id])
	end
end