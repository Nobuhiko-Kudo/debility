class Game < ActiveRecord::Base
  has_many :game_logs, dependent: :destroy
end
