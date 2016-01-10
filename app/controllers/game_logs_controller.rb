class GameLogsController < ApplicationController
  include Roulette
  def roulette
    id = params[:result][:game_id]
    game_time = game_times
    if game_time.to_i >= 5
      ActiveRecord::Base.transaction do
        if judgment_in_accordance_with_cpu_level[level.to_s].call()
          game_log = GameLog.create(user_id: current_user.id, game_id: id, result_flag: 1)
        else
          game_log = GameLog.create(user_id: current_user.id, game_id: id, result_flag: 0)
        end

        RouletteResult.create(
          user_id: current_user.id,
          game_times: game_time,
          collect_times: right_count,
          log_id: game_log.id,
          cpu_level: cpu_level
        )
      end
    end
    redirect_to controller: "games", action: "index"
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
