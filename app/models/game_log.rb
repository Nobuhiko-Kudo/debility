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

end
