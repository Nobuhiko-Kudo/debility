class CreateGameLogs < ActiveRecord::Migration
  def change
    create_table :game_logs do |t|
      t.integer :user_id, null: false
      t.integer :game_id, null: false
      t.integer :result_id, null:false
      t.integer :result_flag

      t.timestamps null: false
    end
  end
end
