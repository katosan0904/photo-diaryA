class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user ,optional: true
  has_many   :comments ,foreign_key: :post_id, dependent: :destroy

  validates_presence_of :user
end
