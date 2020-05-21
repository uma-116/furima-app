require 'rails_helper'

describe ItemsController do
  describe 'GET #index' do
    it "@itemsに正しい値が入っていること" do
      get :index
      expect(assigns(:@items)).to match(@items)
    end

    it "@mens_itemsに正しい値が入っていること" do
      get :index
      expect(assigns(:@mens_items)).to match(@mens_items)
    end

    it "@ladies_itemsに正しい値が入っていること" do
      get :index
      expect(assigns(:@ladies_items)).to match(@ladies_items)
    end

    it "index.html.hamlに遷移すること" do
      get :index
      expect(response).to render_template :index
    end
  end
end