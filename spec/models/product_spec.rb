require 'rails_helper'

describe Product do
  describe '#create' do
    it "全ての条件ができた時に登録される" do
      product = build(:product)
      expect(product).to be_valid
    end

    it "名前がない時は登録できないぞい" do
      product = build(:product, text: "" )
      product.valid?
      expect(product.errors[:text]).to include("を入力してください")
    end

    it "値段がない時は登録できないぞい" do
      product = build(:product, price: "" )
      product.valid?
      expect(product.errors[:price]).to include("を入力してください")
    end

    it "状態がない時は登録できないぞい" do
      product = build(:product, status_id: "" )
      product.valid?
      expect(product.errors[:status_id]).to include("を入力してください")
    end

    it "地域がない時は登録できないぞい" do
      product = build(:product, prefecture_id: "" )
      product.valid?
      expect(product.errors[:prefecture_id ]).to include("を入力してください")
    end

    it "どちらが負担するのかがない時は登録できないぞい" do
      product = build(:product, postage_burden_id: "" )
      product.valid?
      expect(product.errors[:postage_burden_id]).to include("を入力してください")
    end

    it "配送日時がない時は登録できないぞい" do
      product = build(:product, delivery_days_id: "" )
      product.valid?
      expect(product.errors[:delivery_days_id]).to include("を入力してください")
    end

    it "出品状態がない時は登録できないぞい" do
      product = build(:product, sales_status_id: "" )
      product.valid?
      expect(product.errors[:sales_status_id]).to include("を入力してください")
    end
  end
end