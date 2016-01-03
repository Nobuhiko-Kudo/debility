class CreateRouletteResults < ActiveRecord::Migration
  def change
    create_table :roulette_results do |t|
      t.integer :user_id
      t.integer :game_times
      t.integer :collect_times
      t.integer :log_id

      t.timestamps null: false
    end
  end
end
