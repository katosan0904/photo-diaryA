require 'rails_helper'
RSpec.describe Category, type: :model do
  describe '#create' do
    it "is valid with cateegory" do
      category =build(:category)
      category.valid?
      expect(category).to be_valid
    end

    it "is valid without a category" do
      category =build(:category, category:nil)
      category.valid?
      expect(category.errors[:category]).to include("translation missing: ja.activerecord.errors.models.category.attributes.category.blank")
    end
  end
end