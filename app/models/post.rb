# == Schema Information
#
# Table name: posts
#
#  id         :bigint(8)        not null, primary key
#  author_id  :integer          not null
#  wall_id    :integer          not null
#  body       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  validates :author_id, :wall_id, :body, presence: true

  belongs_to :author,
    foreign_key: :author_id,
    class_name: :User

  belongs_to :users_wall,
    foreign_key: :wall_id,
    class_name: :User

  has_many :comments

  has_many :likes,
    as: :likeable
end
