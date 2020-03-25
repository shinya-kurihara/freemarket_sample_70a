class MypagesController < ApplicationController
  def index
    @parents = Category.where(ancestry: nil)
    @user = User.find(current_user.id)
  end

  def logout
  end
end
