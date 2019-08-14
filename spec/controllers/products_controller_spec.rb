require 'rails_helper'

describe ProductsController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET #index' do
    it "インスタンス変数（配列）の値が期待したものになるか" do
      products = create_list(:product, 2)
      get :index
      expect(assigns(:products)).to eq products #match(products.sort{ |a, b| b.created_at <=> a.created_at } )
    end

    it "商品一覧ページに遷移するか" do
      login_user user
      get :index
      expect(response).to render_template :index
    end
  end
  
  describe 'GET #show' do
    it "インスタンス変数の値が期待したものになるか" do
      product = create(:product)
      get :show, params: { id: product }
      expect(assigns(:product)).to eq product
    end
    
    it "商品詳細ページに遷移するか" do
      login_user user
      product = create(:product)
      get :show, params: { id: product }
      expect(response).to render_template :show
    end
  end

  describe 'GET #edit' do
    it "インスタンス変数の値が期待したものになるか" do
      product = create(:product)
      get :edit, params: { id: product }
      expect(assigns(:product)).to eq product
    end
    
    it "商品編集ページに遷移するか" do
      product = create(:product)
      get :edit, params: { id: product }
      expect(response).to render_template :edit
    end
  end
  
  describe 'GET #buy' do
    it "商品購入ページに遷移するか" do
      product = create(:product)
      get :buy, params: { id: product }
      expect(response).to render_template :buy
    end
  end

  describe 'GET #destroy' do
    it "インスタンス変数の値が期待したものになるか" do
      product = create(:product)
      delete :destroy, params: { id: product }
      expect(assigns(:product)).to eq product
    end
  end

end