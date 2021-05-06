class GroupsController < ApplicationController
    def index
        @games = Game.all
    end

    def show
        @game = Game.find(params[:id])
    end

    def new
		@game = Game.new
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