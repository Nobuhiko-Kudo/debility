# == Schema Information
#
# Table name: image_paths
#
#  id         :integer          not null, primary key
#  image_name :string           not null
#  image_path :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ImagePath < ActiveRecord::Base
end
