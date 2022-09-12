require 'rails_helper'

RSpec.describe User, type: :model do
  describe "user test" do
    context "normal condition" do
      it "pass validation" do
        expect(build(:user)).to be_valid
      end

      it "pass vaild email format" do
        valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                          first.last@foo.jp alice+bob@baz.cn]
        valid_addresses.each do |valid_address|
          expect(build(:user, email: valid_address)).to be_valid
        end
      end
    end

    context "abnormal condition" do
      it "reject no name user" do
        user = build(:user, name: " ")
        user.valid?
        expect(user.errors[:name]).to include("必須項目です")
      end

      it "reject loooong name user" do
        user = build(:user, name: "A"*51)
        user.valid?
        expect(user.errors[:name]).to include("長すぎます（50文字以内に収めてください）")
      end

      it "reject no email user" do
        user = build(:user, email: " ")
        user.valid?
        expect(user.errors[:email]).to include("必須項目です")
      end

      it "reject loooong email user" do
        user = build(:user, email: "X"*244+"@example.com")
        user.valid?
        expect(user.errors[:email]).to include("長すぎます（255文字以内に収めてください）")
      end
      
      it "reject invaild email format" do
        invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                          foo@bar_baz.com foo@bar+baz.com fizzbuzz@..test.com]
        invalid_addresses.each do |invalid_address|
          user = build(:user, email: invalid_address)
          user.valid?
          expect(user.errors[:email]).to include("正しいメールアドレスを入力してください")
        end
      end

      it "reject same email user" do
        user = create(:user)
        user.email = user.email.upcase  # メアドは大文字小文字判断しないので、片方大文字にしても一致検査に引っかかるようにテスト
        expect(build(:user, email:user.email)).not_to be_valid
      end
    end
  end
end
