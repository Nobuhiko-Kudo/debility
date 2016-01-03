module Roulette
  def game_times
    params[:result][:game_times]
  end

  def collect_times
    params[:result][:collect_times]
  end

  def winning_parcentage(game_times, result_times)
    if game_times > 5
      collect_times / game_times * 100
    else
      0
    end
  end
end
