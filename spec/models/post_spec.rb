require 'rails_helper'
RSpec.describe Post, type: :model do
  describe '#create' do
    it "is valid with a user_id, category_id, text, title, place, image" do
      post =build(:post)
      post.valid?
      expect(post).to be_valid
    end
    
    it "is valid without a user_id" do
      post =build(:post, user_id: nil)
      post.valid?
      expect(post.errors[:user_id]).to include("translation missing: ja.activerecord.errors.models.post.attributes.user_id.blank")
    end

    # it "is valid without a category_id" do
    #   post =build(:post, category_id: nil)
    #   post.valid?
    #   expect(post.errors[:category_id]).to include("translation missing: ja.activerecord.errors.models.post.attributes.category_id.blank")
    # end

    it "is valid without a image" do
      post =build(:post, image: nil)
      post.valid?
      expect(post.errors[:image]).to include("translation missing: ja.activerecord.errors.models.post.attributes.image.blank")
    end
    
    it "is valid without a title" do
      post =build(:post, title: nil)
      post.valid?
      expect(post.errors[:title]).to include("translation missing: ja.activerecord.errors.models.post.attributes.title.blank")
    end
  end
end