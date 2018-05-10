# == Schema Information
#
# Table name: profiles
#
#  id                  :bigint(8)        not null, primary key
#  user_id             :integer          not null
#  birthday            :string
#  job_title           :string
#  lives_in            :string
#  relationship_status :string
#  owners_names        :string
#  breed               :string
#  fav_toy             :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
