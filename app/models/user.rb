class User < ActiveRecord::Base
  has_many :game_logs
end
