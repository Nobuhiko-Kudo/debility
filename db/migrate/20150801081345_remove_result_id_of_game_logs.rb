class RemoveResultIdOfGameLogs < ActiveRecord::Migration
  def up
    remove_column :game_logs, :result_id
  end

  def down
    add_column :game_logs, :result_id, :integer
  end
end
