module GameLogsHelper
  def game_ranking_list
    @game_ranking_list = []
    Game.ids.each do |game_id|
      game_ranking = {
        game_name: Game.find(game_id).game_name,
        game_ranking: GameLog.ranking(game_id)
      }
      @game_ranking_list.push game_ranking
    end
    @game_ranking_list
  end
end
