class GameLogsController < ApplicationController
  def create
  end

  def index
    @game_list = Game.game_list
  end

  def show
    @game_ranking = GameLog.game_ranking(params[:id])
  end

  def update
  end
end
