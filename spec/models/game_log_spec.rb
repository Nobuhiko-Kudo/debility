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

require 'rails_helper'

describe GameLog do
  subject { GameLog.first }
  
  it { should be_valid }
end
