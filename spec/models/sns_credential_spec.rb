require 'rails_helper'

describe SnsCredential do
  describe "#create" do
    it "バリデーションにひっかからなければ作成される" do
      snscredential = build(:sns_credential)
      expect(snscredential).to be_valid
    end

    it "uidがない場合は保存できないよ" do
      snscredential = build(:sns_credential, uid: "")
      snscredential.valid?
      expect(snscredential.errors[:uid]).to include("を入力してください")
    end

    it "プロバイダーがない場合は保存できないよ" do
      snscredential = build(:sns_credential, provider: "")
      snscredential.valid?
      expect(snscredential.errors[:provider]).to include("を入力してください")
    end
  end
end