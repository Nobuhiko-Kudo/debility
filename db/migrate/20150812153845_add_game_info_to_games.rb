class AddGameInfoToGames < ActiveRecord::Migration
  def change
    add_column :games, :game_info, :string, :after => :game_name
  end
end
