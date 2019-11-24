class Comment < ApplicationRecord
  belongs_to :user ,optional: true
  belongs_to :post ,optional: true

  validates :comment, presence: true
  validates :user, presence: true
  validates :post, presence: true
end
