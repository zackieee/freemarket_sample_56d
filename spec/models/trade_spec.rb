require 'rails_helper'

RSpec.describe Trade, type: :model do
  describe Trade do
    let(:seller) { create(:seller) }
    let(:buyer)  {create(:buyer)}
    let(:product)  {create(:product, seller: seller)}
    let(:trade) { create(:trade, product: product, seller: seller, buyer: buyer) }
    describe '#create' do
      it "全ての条件ができた時に登録される" do
        expect(trade).to be_valid
      end
      it "sellerがない時は登録できない" do
        trade = build(:trade, seller: nil )
        trade.valid?
        expect(trade.errors[:seller]).to include("を入力してください")
      end
      it "buyerがない時は登録できない" do
        trade = build(:trade, buyer: nil )
        trade.valid?
        expect(trade.errors[:buyer]).to include("を入力してください")
      end
      it "productがない時は登録できない" do
        trade = build(:trade, product: nil )
        trade.valid?
        expect(trade.errors[:product]).to include("を入力してください")
      end
      it "pay_idがない時は登録できない" do
        trade = build(:trade, pay_id: nil )
        trade.valid?
        expect(trade.errors[:pay_id]).to include("を入力してください")
      end
      
    end
  end
end
