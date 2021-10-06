class Admin::HomesController < ApplicationController

  def top
    @games = Game.all
  end

end
