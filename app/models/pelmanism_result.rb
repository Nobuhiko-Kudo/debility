# == Schema Information
#
# Table name: pelmanism_results
#
#  id         :integer          not null, primary key
#  cpu_level  :integer          not null
#  user_score :string
#  cpu_score  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  log_id     :integer
#

class PelmanismResult < ActiveRecord::Base
  has_one :game_log, dependent: :destroy
  validates :log_id, presence: true
end
