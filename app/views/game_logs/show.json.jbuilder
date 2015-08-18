json.game_list          @game_ranking  do |game|
  json.user_name        game[:user_name]
  json.game_rank        game[:rank]
  json.game_win_count   game[:win_count]
end
