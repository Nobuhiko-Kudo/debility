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
  has_one :pelmanism_result, foreign_key: "log_id"
  has_one :roulette_result, foreign_key: "log_id"


  validates :user_id, presence: true
  validates :game_id, presence: true

  #ログインしているユーザの選択したゲームの勝数
  def self.vs_cpu(game_id, user_id)
    GameLog.where(game_id: game_id, user_id: user_id)
           .group(:result_flag)
           .count(:user_id)
  end

  #引数のゲームIDについて勝数の多い順にユーザーIDと勝数を返す
  def self.win_count(game_id)
    GameLog.where(game_id: game_id, result_flag: 1)
           .group(:user_id)
           .order('count_user_id desc')
           .count(:user_id)
  end

  #ゲームが3ユーザー以上に実施されていれば、「3」
  #されてなければ、実施したユーザー分の数値を返す
  def self.top_ranking_count_per_game_size(win_count_list)
    if win_count_list.size > 2
      3
    else
      win_count_list.size
    end
  end

  #rankingのトップ画面にある１レコードを出力
  def self.top_ranking_tuple(win_count_list, rank)
      user_id = win_count_list.keys[rank]
      
      user_name = User.find(user_id).user_name
      win_count = win_count_list[user_id]

      record = {
          rank: rank + 1,
          user_name: user_name,
          win_count: win_count
          }
  end

  #rankingのトップ画面にある1ゲームのランキング作成
  def self.top_ranking(game_id)
    ranking = []
    win_count_list = GameLog.win_count(game_id)

    top_ranking_count_per_game_size(win_count_list).times do |rank|
      record = GameLog.top_ranking_tuple(win_count_list, rank)     
      ranking.push record
    end

    ranking
  end

  #game各々に対するrankingを取得
  def self.game_ranking(game_id)
    @game_ranking = []
    win_count = GameLog.win_count(game_id)

    win_count.each_with_index do |count, rank|
      record = GameLog.top_ranking_tuple(win_count, rank)
      @game_ranking.push record
    end 

    @game_ranking
  end
end
