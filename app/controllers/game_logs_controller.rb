class GameLogsController < ApplicationController
  def create
  end

  def index
    @game_list = Game.game_list
  end

  def update
  end
end
