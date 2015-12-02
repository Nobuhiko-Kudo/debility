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

  def record
    user_id = cookies['user_token'] if cookies['user_token']
    @game_record = GameLog.vs_cpu(params[:id], current_user.id).reduce([]) do |array, (key, value)| 
      if key == 1
        array.push({ :win => value.to_s.to_sym })
      elsif key == 0
        array.push({ :lose => value.to_s.to_sym })
      else
        array.push({ :draw => value.to_s.to_sym })
      end
    end
  end
end
