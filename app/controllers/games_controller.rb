class GamesController < ApplicationController
  def index
    @games = Game.paginate(page: params[:page], :per_page => 4)
  end

  def show
   @body_background_color = "roulette_body" if params[:id] == '2'
  end

end
