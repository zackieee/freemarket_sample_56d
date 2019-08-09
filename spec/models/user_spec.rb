require 'rails_helper'

describe User do
  describe '#create' do

    it "全ての条件をクリア！" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "メアドが空の場合は保存できないよ" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "パスワードが空の場合は登録できないよ" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
    
    it "確認用パスワードが空の場合は登録できないよ" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "同じメアドは保存できないよ" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "パスワードが5文字以下は登録できないよ！" do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password][0]).to include("is too short")
    end
    
    it "パスワードが6文字以上なら登録できるよ！" do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user).to be_valid
    end

    #ニックネームが長すぎるときのテスト
    #文字数の長さに関するエラーメッセージが配列に格納されているため、[0]で取り出す。=> "is too short"
    # it "is invalid with a nickname that has more than 7 characters " do
    #   user = build(:user, nickname: "aaaaaaaa")
    #   user.valid?
    #   expect(user.errors[:nickname][0]).to include("is too long")
    # end

  end
end