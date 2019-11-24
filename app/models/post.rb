class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user ,optional: true
  has_many   :comments ,foreign_key: :post_id, dependent: :destroy
  belongs_to :category 
  accepts_nested_attributes_for :category
  
  validates :user_id, presence: true
  validates :image, presence: true
  validates :title, presence: true
end
