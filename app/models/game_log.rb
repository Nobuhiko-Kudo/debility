class GameLog < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
  has_one :pelmanism_result, dependent: :destroy

  validates :user_id, presence: true
  validates :game_id, presence: true
  validates :result_id, presence: true

end
