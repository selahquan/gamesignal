class GroupsController < ApplicationController
    def index
        @groups = Group.all
    end

    def show
        @group = Group.find(params[:id])
    end

    def new
		@group = Group.new
		#@categories = Category.all
	end

    def create
		group = Group.create(post_params)
		redirect_to group_path(group)
	end

	def edit
		@group = Group.find(params[:id])
		#@categories = Category.all
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
end