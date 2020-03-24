require 'rails_helper'

describe ItemsController, type: :controller do
  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "assigns the requested item to @item" do
      get :edit, params: { id: item }
      expect(assigns(:item)).to eq item
    end

    it "renders the :edit template" do
      get :edit, params: { id: item }
      expect(response).to render_template :edit
    end
  end

end