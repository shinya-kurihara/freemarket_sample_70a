class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :destroy]

  def index
    @items = Item.includes(:item_images).order("created_at DESC")
  end

  def show
    @item_images = @item.item_images
  end

  def destroy
    if @item.seller_id == current_user.id
      @item.destroy
    end
    redirect_to root_path
  end

private

  def set_item
    @item = Item.find(params[:id])
  end

end