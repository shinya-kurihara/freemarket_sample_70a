require 'rails_helper'

describe ItemsController do
  describe 'GET #search' do
    it "renders the :search template" do
      get :search
      expect(response).to render_template :search

    end
  end
end