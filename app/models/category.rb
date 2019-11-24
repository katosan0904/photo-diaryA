class Category < ApplicationRecord
  has_many :posts, foreign_key: :category_id, dependent: :nullify

  validates :category, presence: true, uniqueness: true

  def instead_of_category
    self.posts.each do |post|
      post.category_id= nil
      category=Category.first
      post.category_id = category.id
      post.save
    end
  end
end
