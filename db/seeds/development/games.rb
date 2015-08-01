game_names = []

5.times do |i| 
  game_names.push "dev_game_#{i}" 
end

game_names.each do |game_name|
  Game.create(game_name: game_name) unless Game.exists? game_name: game_name
end
