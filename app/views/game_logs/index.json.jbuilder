json.game_list      @game_list  do |game|
  json.game_id      game.id
  json.game_name    game.game_name
end
json.games    game_ranking_list do |games|
  json.game_name        games[:game_name]
  json.game_result      games[:game_ranking] do |game_result|
    json.user_name        game_result[:user_name]
    json.game_rank        game_result[:rank]
    json.game_win_count   game_result[:win_count]
  end
end
