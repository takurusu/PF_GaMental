class HomesController < ApplicationController

  def top
    @games = Game.all
    @user = current_user
  end

end
