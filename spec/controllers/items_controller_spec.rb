require 'rails_helper'

describe ItemsController do
  describe 'GET #index' do
    it "@itemsに正しい値が入っていること" do
      # items = create_list(:item, 3)
      get :index
      expect(assigns(:@items)).to match(@items)
    end

    it "index.html.hamlに遷移すること" do
      get :index
      expect(response).to render_template :index
    end
  end
end