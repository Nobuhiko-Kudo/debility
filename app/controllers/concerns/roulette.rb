module Roulette
  def game_times
    params[:roulette_result][:game_times]
  end

  def collect_times
    params[:roulette_result][:collect_times]
  end

  def cpu_level
    params[:roulette_result][:cpu_level]
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
      '1' => -> () { (collect_times.to_f/game_times.to_f).round(1) >= 0.5 },
      '2' => -> () { (collect_times.to_f/game_times.to_f).round(1) >= 0.8 },
      '3' => -> () { (collect_times.to_f/game_times.to_f).round(1) >= 1.0 },
    }
  end

  def result_hash
    {
      0 => :lose_count,
      1 => :win_count,
    }
  end
end
