class Category < ApplicationRecord
  has_many :posts, foreign_key: :category_id, dependent: :destroy
end
