require 'rails_helper'
RSpec.describe User, type: :model do
  describe '#create' do
    it "is valid with nickname, email, password, password_confirmation " do
      user =build(:user)
      user.valid?
      expect(user).to be_valid
    end

    it "is invalid without a nickname" do
      user = build(:user, nickname:nil)
      user.valid?
      expect(user.errors[:nickname]).to include("translation missing: ja.activerecord.errors.models.user.attributes.nickname.blank")
    end

    it "is invalid without a password" do
      user = build(:user, password:nil)
      user.valid?
      expect(user.errors[:password]).to include("translation missing: ja.activerecord.errors.models.user.attributes.password.blank")
    end

    it "is invalid without a email" do
      user = build(:user, email:nil)
      user.valid?
      expect(user.errors[:email]).to include("translation missing: ja.activerecord.errors.models.user.attributes.email.blank")
    end

    it "is invalid without a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("translation missing: ja.activerecord.errors.models.user.attributes.email.taken")
    end

    it "is invalid without format of email is inaccurate" do
      user = build(:user, email:"aaaagmail.com")
      user.valid?
      expect(user.errors[:email]).to include("translation missing: ja.activerecord.errors.models.user.attributes.email.invalid")
    end

    it "is invalid without a password that has less than 7 characters " do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      user.valid?
      expect(user.errors[:password][0]).to include("translation missing: ja.activerecord.errors.models.user.attributes.password.too_short")
    end
  end
end