class AddCpuLevelOfRouletteResults < ActiveRecord::Migration
  def change
    add_column :roulette_results, :cpu_level, :integer 
  end
end
