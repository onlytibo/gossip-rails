class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :gossip
  validates :comment, presence: true
  validates :user, presence: true
  validates :gossip, presence: true

end
