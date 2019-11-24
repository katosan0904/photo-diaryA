require 'rails_helper'
RSpec.describe Comment, type: :model do
  describe '#create' do
    it "is valid with a comment, user_id, post_id" do
      comment =build(:comment)
      comment.valid?
      expect(comment).to be_valid
    end

    it "is valid without a user_id" do
      comment =build(:comment, user_id: nil)
      comment.valid?
      expect(comment.errors[:user]).to include("translation missing: ja.activerecord.errors.models.comment.attributes.user.blank")
    end

    it "is valid without a post_id" do
      comment =build(:comment, post_id: nil)
      comment.valid?
      expect(comment.errors[:post]).to include("translation missing: ja.activerecord.errors.models.comment.attributes.post.blank")
    end

    it "is valid without a comment" do
      comment =build(:comment, comment: nil)
      comment.valid?
      expect(comment.errors[:comment]).to include("translation missing: ja.activerecord.errors.models.comment.attributes.comment.blank")
    end
  end
end