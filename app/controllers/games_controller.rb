class GamesController < ApplicationController
  def index
    @games = Game.paginate(page: params[:page], :per_page => 4)
  end
end
