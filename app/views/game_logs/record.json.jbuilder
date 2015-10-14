json.game_record          @game_record.each do |record|
  if record.keys.include?(:win)
    json.win_count        record[:win]
  elsif record.keys.include?(:lose)
    json.lose_count       record[:lose]
  else
    json.draw_count       record[:draw]
  end
end
