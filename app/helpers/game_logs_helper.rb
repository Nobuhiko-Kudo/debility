module GameLogsHelper
  def game_ranking_list
    @game_ranking_list = []
    game_list = [
      :pelmanism_result,
      :roulette_result,
    ]
    game_logs = GameLog.includes(:pelmanism_result, 
                                 :roulette_result)
                       .joins(:game, :user)
                       .where(result_flag: 1)
    @game_log_list = {
        '神経衰弱'   => [],
        'ルーレット' => [],
        'dev_game_0' => [],
        'dev_game_1' => [],
        'dev_game_2' => [],
    }
    game_logs.each do |game_log| 
      gl = { 
        user_name:   game_log.user.user_name,
      }
      if game_log.game_id == 1
        gl[:cpu_level] = game_log.pelmanism_result.cpu_level
      elsif game_log.game_id == 2
        gl[:cpu_level] = game_log.roulette_result.cpu_level
      else
        gl[:cpu_level] = 1
      end

      @game_log_list[game_log.game.game_name].push gl        
    end

    @game_log_list
    
    #ここから下は元のやつ
    # games = Game.all
   # games.each do |game|
   #   game_ranking = {
   #     game_name: game.game_name,
   #     game_ranking: GameLog.top_ranking(game.id)
   #   }
   #   @game_ranking_list.push game_ranking
   # end
   # @game_ranking_list
  end
end
