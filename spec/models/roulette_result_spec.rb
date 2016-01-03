# == Schema Information
#
# Table name: roulette_results
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  game_times    :integer
#  collect_times :integer
#  log_id        :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe RouletteResult, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
