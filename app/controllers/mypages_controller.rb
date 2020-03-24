class MypagesController < ApplicationController
  def index
    @parents = Category.where(ancestry: nil)
  end

  def logout
  end
end
