require 'rails_helper'

describe ProductsController do
  describe 'GET #index' do
    # it "インスタンス変数（配列）の値が期待したものになるか" do
    #   products = create_list(:product, 5)
    #   get :index
    #   expect(assigns(:products)).to match(products.sort{ |a, b| b.created_at <=> a.created_at } )
    # end

    it "一覧ページに遷移するか" do
      get :index
      expect(response).to render_template :index
    end
  end

  # describe 'GET #show' do
  #   it "インスタンス変数の値が期待したものになるか" do
  #     product = create(:product)
  #     get :show, params: { id: product }
  #     expect(assigns(:product)).to eq product
  #   end

  #   it "一覧ページに遷移するか" do
  #     product = create(:product)
  #     get :show, params: { id: product }
  #     expect(response).to render_template :show
  #   end
  # end

  describe 'GET #buy' do
    it "一覧ページに遷移するか" do
      get :buy
      expect(response).to render_template :buy
    end
  end

end