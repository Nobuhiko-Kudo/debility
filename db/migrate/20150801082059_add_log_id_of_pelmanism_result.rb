class AddLogIdOfPelmanismResult < ActiveRecord::Migration
  def  up
    add_column :pelmanism_results, :log_id, :integer
  end

  def down
    remove_column :pelmanism_results, :log_id
  end
end
