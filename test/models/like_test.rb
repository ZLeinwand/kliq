# == Schema Information
#
# Table name: likes
#
#  id            :bigint(8)        not null, primary key
#  likeable_type :string
#  likeable_id   :bigint(8)
#  user_id       :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class LikeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
