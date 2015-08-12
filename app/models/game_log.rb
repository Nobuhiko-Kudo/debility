# == Schema Information
#
# Table name: game_logs
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  game_id     :integer          not null
#  result_flag :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class GameLog < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
  belongs_to :pelmanism_result, foreign_key: "log_id"


  validates :user_id, presence: true
  validates :game_id, presence: true

  def self.win_count(game_id)
    GameLog.where(game_id: game_id, result_flag: 1)
           .group(:user_id)
           .order('count_user_id desc')
           .count(:user_id)
  end

  def self.ranking(game_id)
    ranking = []
    win_count_list = GameLog.win_count(game_id)

    3.times do |rank|
      user_id = win_count_list.keys[rank]
      user_name = User.find(user_id).user_name
      win_count = win_count_list[user_id]

          record = {
                    rank: rank + 1,
                    user_name: user_name,
                    win_count: win_count
                    }
          ranking.push record
    end
    ranking
  end
end
