roulette_results = []

4.times do |i|
  roulette_results.push cpu_level: 1, user_id: 1, game_times: 5, collect_times: 4, log_id: i+13
end

3.times do |i|
  roulette_results.push cpu_level: 1, user_id: 2, game_times: 5, collect_times: 4, log_id: i+17
end

2.times do |i|
  roulette_results.push cpu_level: 1, user_id: 3, game_times: 5, collect_times: 4, log_id: i+20
end

2.times do |i|
  roulette_results.push cpu_level: 1, user_id: 4, game_times: 5, collect_times: 4, log_id: i+22
end

roulette_results.push cpu_level: 1, user_id: 5, game_times: 5, collect_times: 4, log_id: 24

roulette_results.each do |roulette_result|
  RouletteResult.create!(roulette_result)
end
