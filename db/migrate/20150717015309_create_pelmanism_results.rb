class CreatePelmanismResults < ActiveRecord::Migration
  def change
    create_table :pelmanism_results do |t|
      t.integer :cpu_level, null: false
      t.string :user_score
      t.string :cpu_score

      t.timestamps null: false
    end
  end
end
