class Comment < ApplicationRecord
  belongs_to :user ,optional: true
  belongs_to :post ,optional: true

  validates :comment, presence: true
  validates_presence_of :user
  validates_presence_of :post
end
