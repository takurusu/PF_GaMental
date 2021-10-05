class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
    @user = current_user
  end

  def create
    @game = Game.new(game_params)
    @game.user_id = current_user.id
    @game.save!
    redirect_to games_path
  end

  def show
    @game = Game.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    @game.update(game_params)
    redirect_to game_path
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to games_path
  end

  private

    def game_params
      params.require(:game).permit(:image, :title, :text)
    end

end
