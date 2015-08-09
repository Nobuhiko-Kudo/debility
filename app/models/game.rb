# == Schema Information
#
# Table name: games
#
#  id         :integer          not null, primary key
#  game_name  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Game < ActiveRecord::Base
  has_many :game_logs, dependent: :destroy

  
  def self.game_list
   Game.all.pluck(:game_name) 
  end

end
