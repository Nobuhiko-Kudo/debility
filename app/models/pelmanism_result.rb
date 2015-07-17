class PelmanismResult < ActiveRecord::Base
  belongs_to :game_log, foreign_key: "result_id" 
end
