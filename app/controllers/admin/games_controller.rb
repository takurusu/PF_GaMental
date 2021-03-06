class Admin::GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    @user = @game.user.id
    @comment = Comment.new
    @favorite = Favorite.new
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    @game.update(game_params)
    redirect_to admin_game_path
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to admin_games_path
  end

  private

    def game_params
      params.require(:game).permit(:image, :title, :text)
    end

    def user_params
      params.require(:user).permit(:user_id)
    end

end
