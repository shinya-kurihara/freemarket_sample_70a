class MypagesController < ApplicationController
  def index
    @user = User.find(current_user.id)
  end

  def logout
  end
end
