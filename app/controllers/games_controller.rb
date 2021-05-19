class GroupsController < ApplicationController
    def index
        @games = Game.all
    end

    def show
        @game = Game.find(params[:id])
    end

	private

	def group_params
		params.require(:group).permit(:title, :content, :game)
	end
end