module Roulette
  def game_times
    params[:result][:game_times]
  end

  def right_count
    params[:result][:right_count]
  end

  def cpu_level
    params[:result][:cpu_level]
  end

  def winning_parcentage(game_times, result_times)
    if game_times > 5
      collect_times / game_times * 100
    else
      0
    end
  end

  def judgment_in_accordance_with_cpu_level
    {
      '1' => -> () { right_count.to_f/game_times.to_f >= 0.5 },
      '2' => -> () { right_count.to_f/game_times.to_f >= 0.8 },
      '3' => -> () { right_count.to_f/game_times.to_f >= 1 }
    }
  end
end
