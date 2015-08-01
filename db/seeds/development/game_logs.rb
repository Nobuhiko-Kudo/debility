game_logs = []

5.times do |j|
  5.times do |i|
    game_logs.push user_id: i+1, game_id: j+1, result_flag: 1
  end

  4.times do |i|
    game_logs.push user_id: i+1, game_id: j+1, result_flag: 1 
  end

  2.times do |i|
    game_logs.push user_id: i+1, game_id: j+1, result_flag: 1
  end

  game_logs.push user_id: 1, game_id: j+1, result_flag: 1
end

game_logs.each do |game_log|
  GameLog.create(
   user_id: game_log[:user_id],
   game_id: game_log[:game_id],
   result_flag: game_log[:result_flag]
 )
end

