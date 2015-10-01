games = []

games.push game_name: "神経衰弱", game_info: '神経衰弱の説明'
games.push game_name:"ルーレット", game_info:'ルーレットをクリックして猫の位置に止まる色を当てるゲーム'

3.times do |i|
  games.push game_name:"dev_game_#{i}", game_info:"dev_game_#{i}の説明"
end

games.each do |game|
  Game.create(game) unless Game.exists? game
end
