class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :game_name, null: false

      t.timestamps null: false
    end

    add_index :games, :game_name, unique: true
  end
end
